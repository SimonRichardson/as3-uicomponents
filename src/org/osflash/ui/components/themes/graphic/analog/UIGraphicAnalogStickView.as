package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.button.UIButton;
	import org.osflash.ui.components.analog.IUIAnalogStickView;
	import org.osflash.ui.components.analog.UIAnalogStick;
	import org.osflash.ui.components.analog.UIAnalogStickSignalProxy;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentStateAction;
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentView;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.geom.Point;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicAnalogStickView extends UIGraphicComponentView 
															implements IUIAnalogStickView
	{
		
		/**
		 * @private
		 */
		private var _component : UIAnalogStick;
		
		/**
		 * @private
		 */
		private var _container :  DisplayObjectContainer;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIAnalogStickSignalProxy;
		
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
		private var _config : IUIAnalogStickViewConfig;
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIAnalogStickColourScheme;
		
		/**
		 * @private
		 */
		private var _graphicsData : UIGraphicsData;
				
		public function UIGraphicAnalogStickView(config : IUIAnalogStickViewConfig)
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
						
			_component = UIAnalogStick(component);
			
			_container = _component.displayObjectContainer;
			_container.addChild(_background = new Shape());
			_component.add(_button = new UIButton(_config.buttonView));

			_signalProxy = UIAnalogStickSignalProxy(_component.signalProxy);
			_signalProxy.action.add(handleActionSignal);
			
			initConfig(_config);
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
			
			if(null != _button)
			{
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
			
			_button.width = width * 0.33;
			_button.height = height * 0.33;
						
			repaint();
		}
		
		/**
		 * @private
		 */	
		override protected function initConfig(config : IUIComponentViewConfig) : void
		{
			super.initConfig(config);
			
			_colourScheme = _config.colourScheme;
			
			//_graphicsData = _colourScheme.up;
		}
		
		/**
		 * @private
		 */
		protected function repaint() : void
		{
			//graphics.context(_background.graphics);
			
			//graphics.clear();
			//graphics.style(_graphicsData);
			//graphics.drawRectangle(innerBounds);
			//graphics.endFill();
		}
		
		/**
		 * @private
		 */
		protected function handleActionSignal(value : int) : void
		{
			/*
			if((value & UIComponentStateAction.PRESSED) != 0)
				_graphicsData = _colourScheme.down;
			else 
			{
				if((value & UIComponentStateAction.HOVERED) != 0)
					_graphicsData = _colourScheme.over;
				else
					_graphicsData = _colourScheme.up;
			}
						
			repaint();
			 * 
			 */
		}
	}
}