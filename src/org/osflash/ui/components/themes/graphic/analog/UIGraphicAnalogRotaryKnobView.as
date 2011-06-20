package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.natives.NativeSignal;
	import org.osflash.ui.components.analog.IUIAnalogRotaryKnobView;
	import org.osflash.ui.components.analog.UIAnalogRotaryKnob;
	import org.osflash.ui.components.analog.UIAnalogRotaryKnobModel;
	import org.osflash.ui.components.analog.UIAnalogRotaryKnobSignalProxy;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentStateAction;
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentView;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicAnalogRotaryKnobView extends UIGraphicComponentView 
															implements IUIAnalogRotaryKnobView
	{
		
		private static const ANGLE_MIN : Number = Math.PI / 4 * 3;
		
		private static const ANGLE_MAX : Number = Math.PI / 4 * 6;
		
		/**
		 * @private
		 */
		private var _component : UIAnalogRotaryKnob;
		
		/**
		 * @private
		 */
		private var _container :  DisplayObjectContainer;
		
		/**
		 * @private
		 */
		private var _model : UIAnalogRotaryKnobModel;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIAnalogRotaryKnobSignalProxy;
		
		/**
		 * @private
		 */
		private var _background : Shape;
		
		/**
		 * @private
		 */
		private var _knob : Shape;
		
		/**
		 * @private
		 */
		private var _config : IUIAnalogRotaryKnobViewConfig;
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIAnalogRotaryKnobColourScheme;
		
		/**
		 * @private
		 */
		private var _backgroundGraphicsData : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _knobGraphicsData : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _radius : int;
		
		/**
		 * @private
		 */
		private var _lastMousePos : Point;
		
		/**
		 * @private
		 */
		private var _mouseDown : Boolean;
		
		/**
		 * @private
		 */
		private var _position : Number; 
		
		/**
		 * @private
		 */
		private var _positionTarget : Number;
		
		/**
		 * @private
		 */
		private var _animating : Boolean;
		
		/**
		 * @private
		 */
		private var _positionStoredValue : Boolean;
		
		/**
		 * @private
		 */
		private var _nativeEnterFrameSignal : ISignal;
						
		public function UIGraphicAnalogRotaryKnobView(config : IUIAnalogRotaryKnobViewConfig)
		{
			super();
			
			_config = config;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function bind(component : IUIComponent) : void
		{
			super.bind(component);
						
			_component = UIAnalogRotaryKnob(component);
			
			_container = _component.displayObjectContainer;
			_container.addChild(_background = new Shape());
			_container.addChild(_knob = new Shape());
			
			_model = UIAnalogRotaryKnobModel(_component.model);
			
			_signalProxy = UIAnalogRotaryKnobSignalProxy(_component.signalProxy);
			_signalProxy.action.add(handleActionSignal);
			_signalProxy.position.add(handlePositionSignal);
			
			initConfig(_config);
			
			_lastMousePos = new Point();
			
			_position = 0;
			_positionTarget = 0;
			_positionStoredValue = false;
			
			_mouseDown = false;
			_animating = false;
			
			_nativeEnterFrameSignal = new NativeSignal(_container, Event.ENTER_FRAME);
		}
				
		/**
		 * @inheritDoc
		 */	
		override public function unbind() : void
		{
			_component = null;
			_container = null;
			
			if(null != _background)
			{
				if(null != _background.parent)
					_background.parent.removeChild(_background);
				_background = null;
			}
						
			if(null != _signalProxy)
			{
				_signalProxy.action.remove(handleActionSignal);
				_signalProxy = null;
			}
			
			super.unbind();
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function captureTarget(point : Point) : ISignalTarget
		{
			if(!_container.visible || !_component.enabled) return null;
			
			const local : Point = _container.globalToLocal(point);
			const dx : Number = local.x - _radius;
			const dy : Number = local.y - _radius;
			
			const distance : Number = Math.sqrt((dx * dx) + (dy * dy));
			return (distance <= _radius) ? _component : null;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function resizeTo(width : int, height : int) : void
		{
			super.resizeTo(width, height);
			
			_radius = width * 0.5;
			
			repaint();
			updateKnob();
		}
		
		/**
		 * @private
		 */	
		override protected function initConfig(config : IUIComponentViewConfig) : void
		{
			super.initConfig(config);
			
			_colourScheme = _config.colourScheme;
			
			_knobGraphicsData = _colourScheme.knobUp;
			_backgroundGraphicsData = _colourScheme.backgroundUp;
		}
		
		/**
		 * @private
		 */
		protected function repaint() : void
		{
			graphics.context(_background.graphics);
			
			graphics.clear();
			graphics.style(_backgroundGraphicsData);
			graphics.drawCircle(innerBounds.x + _radius, innerBounds.y + _radius, _radius);
			graphics.endFill();
		}
		
		/**
		 * @private
		 */
		protected function repaintKnob() : void
        {
			const angle: Number = ( Math.PI / 4 * 3 ) + _model.position * ( Math.PI / 4 * 6 );
			
			const cs: Number = Math.cos( angle );
			const sn: Number = Math.sin( angle );
			
			const r1: Number = _radius - (_radius * 0.25);
			
			graphics.context(_knob.graphics);
			
			graphics.clear();
			graphics.style(_knobGraphicsData);
			graphics.drawCircle((cs * r1) + _radius, (sn * r1) + _radius, _radius * 0.1);
			graphics.endFill();
			
			_positionStoredValue = false;
        }
        
        /**
         * @private
         */
        protected function updateKnob() : void
        {
        	if(_animating) _positionStoredValue = true;
			else repaintKnob();	
        }
		
		/**
		 * @private
		 */
		protected function handleActionSignal(value : int) : void
		{
			if((value & UIComponentStateAction.PRESSED) != 0)
			{
				_knobGraphicsData = _colourScheme.knobDown;
				_backgroundGraphicsData = _colourScheme.backgroundDown;
			}
			else 
			{
				if((value & UIComponentStateAction.HOVERED) != 0)
				{
					_knobGraphicsData = _colourScheme.knobOver;
					_backgroundGraphicsData = _colourScheme.backgroundOver;
				}
				else
				{
					_knobGraphicsData = _colourScheme.knobUp;
					_backgroundGraphicsData = _colourScheme.backgroundUp;
				}
			}
			
			repaint();
			updateKnob();
		}
		
		/**
		 * @private
		 */
		protected function handlePositionSignal(value : Number) : void
		{
			updateKnob();
			
			value;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function handleMouseDownSignal(	target : ISignalTarget,
															mousePos : Point
															) : void
		{
			super.handleMouseDownSignal(target, mousePos);
			
			_mouseDown = true;
			
			_nativeEnterFrameSignal.add(handleEnterFrameSignal);
		}
		
		/**
		 * @private
		 */
		protected function handleEnterFrameSignal(event : Event) : void
		{
			var speed : Number;
			
			// Handle mouse down
			if(_mouseDown)
			{
				speed = 0.4; 
				
		        _position -= (_container.mouseY - _lastMousePos.y) / 100;
		        
		        if(_position < 0) _position = 0;
		        else if(_position > 1) _position = 1;
			}
	        else
	        {
	        	speed = 0.25;
	        	
	        	const diff : Number = _position - _positionTarget;
	        	const abs : Number = diff < 0 ? -diff : diff;
	        	if(abs < 0.005) 
	        	{
	        		_animating = false;
	        		_nativeEnterFrameSignal.remove(handleEnterFrameSignal);
	        			        		
	        		if(_positionStoredValue) repaintKnob();
	        		
	        		return;
	        	}
	        }
	        
	        _animating = true;
	        	        
	        _positionTarget += (_position - _positionTarget) * speed;
	        
	        if(_positionTarget < 0) _positionTarget = 0;
		    else if(_positionTarget > 1) _positionTarget = 1;
	         
	        _lastMousePos.x = _container.mouseX;
	        _lastMousePos.y = _container.mouseY;
	        
			const angle: Number = ANGLE_MIN + _positionTarget * ANGLE_MAX;
			
			const cs: Number = Math.cos( angle );
			const sn: Number = Math.sin( angle );
			
			const r1: Number = _radius - (_radius * 0.25);
			
			graphics.context(_knob.graphics);
			
			graphics.clear();
			graphics.style(_knobGraphicsData);
			graphics.drawCircle((cs * r1) + _radius, (sn * r1) + _radius, _radius * 0.1);
			graphics.endFill();
			
			_model.position = _position;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function handleMouseUpSignal(	target : ISignalTarget, 
															mousePos : Point
															) : void
		{
			super.handleMouseUpSignal(target, mousePos);
			
			_mouseDown = false;
		}
	}
}
