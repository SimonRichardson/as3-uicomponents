package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.natives.NativeSignal;
	import org.osflash.ui.components.analog.IUIAnalogSliderView;
	import org.osflash.ui.components.analog.UIAnalogSlider;
	import org.osflash.ui.components.analog.UIAnalogSliderModel;
	import org.osflash.ui.components.analog.UIAnalogSliderSignalProxy;
	import org.osflash.ui.components.button.UIButton;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentStateAction;
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentView;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogSliderView extends UIGraphicComponentView implements IUIAnalogSliderView
	{
		
		public static const MATH_PI_TWO : Number = Math.PI * 2;
		
		/**
		 * @private
		 */
		private var _component : UIAnalogSlider;
		
		/**
		 * @private
		 */
		private var _container :  DisplayObjectContainer;
		
		/**
		 * @private
		 */
		private var _model : UIAnalogSliderModel;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIAnalogSliderSignalProxy;
		
		/**
		 * @private
		 */
		private var _background : Shape;
		
		/**
		 * @private
		 */
		private var _button : UIButton;
		
		/**
		 * @private
		 */
		private var _config : IUIAnalogSliderViewConfig;
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIAnalogSliderColourScheme;
		
		/**
		 * @private
		 */
		private var _graphicsData : UIGraphicsData;
				
		/**
		 * @private
		 */
		private var _buttonTarget : Point;
		
		/**
		 * @private
		 */
		private var _buttonMouseDown : Boolean;
		
		/**
		 * @private
		 */
		private var _buttonMouseDownPos : Point;
		
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
				
		public function UIAnalogSliderView(config : IUIAnalogSliderViewConfig)
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
						
			_component = UIAnalogSlider(component);
			
			_container = _component.displayObjectContainer;
			_container.addChild(_background = new Shape());
			_component.add(_button = new UIButton(_config.buttonView));
			
			_model = UIAnalogSliderModel(_component.model);

			_signalProxy = UIAnalogSliderSignalProxy(_component.signalProxy);
			_signalProxy.action.add(handleActionSignal);
			_signalProxy.position.add(handlePositionSignal);
			
			initConfig(_config);
			
			_animating = false;
			_positionStoredValue = false;
			
			_buttonTarget = new Point();
			_buttonMouseDown = false;
			_buttonMouseDownPos = new Point();
			
			_nativeEnterFrameSignal = new NativeSignal(_container, Event.ENTER_FRAME);
			
			_component.signals.mouseDownSignal.add(handleMouseDownSignal);
			
			_button.signals.mouseInSignal.add(handleButtonMouseInSignal);
			_button.signals.mouseDownSignal.add(handleButtonMouseDownSignal);
			_button.signals.mouseUpSignal.add(handleButtonMouseUpSignal);
			_button.signals.focusOutSignal.add(handleButtonFocusOutSignal);
		}
				
		/**
		 * @inheritDoc
		 */	
		override public function unbind() : void
		{
			if(null != _component)
			{
				_component.signals.mouseDownSignal.remove(handleMouseDownSignal);
				_component = null;
			}
			
			_container = null;
			
			if(null != _background)
			{
				if(null != _background.parent)
					_background.parent.removeChild(_background);
				_background = null;
			}
			
			if(null != _button)
			{
				_button.signals.mouseInSignal.remove(handleButtonMouseInSignal);
				_button.signals.mouseDownSignal.remove(handleButtonMouseDownSignal);
				_button.signals.mouseUpSignal.remove(handleButtonMouseUpSignal);
				_button.signals.focusOutSignal.remove(handleButtonFocusOutSignal);
				
				if(_component.contains(_button))
					_component.remove(_button);
				_button = null;
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
			if(_button.captureTarget(point)) return _button;
			
			point = _container.globalToLocal(point);
			return innerBounds.containsPoint(point) ? _component : null;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function resizeTo(width : int, height : int) : void
		{
			super.resizeTo(width, height);
			
			_button.width = height * 2;
			_button.height = height * 2;
						
			_button.x = -(_button.width * 0.5);
			_button.y = -((_button.height - height) * 0.5);
			
			repaint();
		}
		
		/**
		 * @private
		 */	
		override protected function initConfig(config : IUIComponentViewConfig) : void
		{
			super.initConfig(config);
			
			_colourScheme = _config.colourScheme;
			
			_graphicsData = _colourScheme.backgroundUp;
		}
		
		/**
		 * @private
		 */
		protected function repaint() : void
		{
			graphics.context(_background.graphics);
			
			graphics.clear();
			graphics.style(_graphicsData);
			graphics.drawRoundRectangle(innerBounds, innerBounds.height * 0.5);
			graphics.endFill();
		}
		
		/**
		 * @private
		 */
		protected function updateButton() : void
		{
			if(_buttonMouseDown) return;
			
			if(_animating) _positionStoredValue = true;
			else
			{
				const radius : Number = _button.width * 0.5;
				const displayObject : DisplayObject = _button.displayObject;
				
				const dx : Number = (_model.position * innerBounds.width) - radius;
				displayObject.x = dx;
				
				_positionStoredValue = false;
			}
		}
		
		/**
		 * @private
		 */
		protected function handleActionSignal(value : int) : void
		{
			if((value & UIComponentStateAction.PRESSED) != 0)
				_graphicsData = _colourScheme.backgroundDown;
			else 
			{
				if((value & UIComponentStateAction.HOVERED) != 0)
					_graphicsData = _colourScheme.backgroundOver;
				else
					_graphicsData = _colourScheme.backgroundUp;
			}
						
			repaint();
		}
				
		/**
		 * @private
		 */
		protected function handlePositionSignal(value : Number) : void
		{
			updateButton();
			
			value;
		}
				
		/**
		 * @private
		 */
		protected function handleButtonMouseDownSignal(	target : ISignalTarget, 
														mousePos : Point
														) : void
		{
			if(target != _button) return;
						
			_buttonMouseDown = true;
			_buttonMouseDownPos = _button.displayObject.globalToLocal(mousePos);
						
			if(!_animating) _nativeEnterFrameSignal.add(handleEnterFrameSignal);
		}
		
		/**
		 * @private
		 */
		override protected function handleMouseDownSignal(	target : ISignalTarget, 
															mousePos : Point
															) : void
		{
			super.handleMouseDownSignal(target, mousePos);
			
			if(target != _component) return;
			
			_buttonMouseDown = true;
			
			if(!_animating) _nativeEnterFrameSignal.add(handleEnterFrameSignal);
		}
		
		/**
		 * @private
		 */
		protected function handleEnterFrameSignal(event : Event) : void
		{
			_animating = true;
			
			const displayObject : DisplayObject = _button.displayObject;
			
			var speed : Number;
			if(_buttonMouseDown)
			{
				speed = 0.4;
				
				const radius : Number = _button.width * 0.5;
				
				var dx : Number = (_container.mouseX - _buttonMouseDownPos.x);				
				if(dx < innerBounds.x - radius) dx = innerBounds.x - radius;
				else if(dx > innerBounds.width - radius) dx = innerBounds.width - radius;
					
				_buttonTarget.x = dx;
				
				displayObject.x += (_buttonTarget.x - displayObject.x) * speed;
				
				_model.position = (dx + radius) / innerBounds.width;
			}
			else
			{
				speed = 0.25;
				
				// TODO : Turn this into an transition
				displayObject.x += (_buttonTarget.x - displayObject.x) * speed;
				
				const diff : Number = displayObject.x - _buttonTarget.x;
				const abs : Number = diff < 0 ? -diff : diff;
				
				if(abs < 0.01)
				{
					_animating = false;
					_nativeEnterFrameSignal.remove(handleEnterFrameSignal);
					
					if(_positionStoredValue) updateButton();
				}
			}
		}
		
		/**
		 * @private
		 */
		protected function handleButtonMouseUpSignal(		target : ISignalTarget, 
															mousePos : Point
															) : void
		{
			_buttonMouseDown = false;
			
			target;
			mousePos;
		}
		
		/**
		 * @private
		 */
		protected function handleButtonMouseInSignal(		target : ISignalTarget, 
															mousePos : Point,
															mouseDown : Boolean
															) : void
		{
			if(!_component.state.hovered) _component.state.hovered = true;
			
			target;
			mousePos;
			mouseDown;
		}
		
		/**
		 * @private
		 */
		protected function handleButtonFocusOutSignal(target : ISignalTarget) : void
		{
			if(_component.state.hovered) _component.state.hovered = false;
			
			target;
		}
		
		/**
		 * @private
		 */
		override protected function handleMouseUpSignal(	target : ISignalTarget, 
															mousePos : Point
															) : void
		{
			super.handleMouseUpSignal(target, mousePos);
			
			_buttonMouseDown = false;
		}
	}
}
