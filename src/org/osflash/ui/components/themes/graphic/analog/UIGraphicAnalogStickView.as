package org.osflash.ui.components.themes.graphic.analog
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.GraphicsPath;
	import flash.display.IGraphicsData;
	import flash.display.IGraphicsFill;
	import flash.display.Shape;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.osflash.ui.components.analog.UIAnalogStick;
	import org.osflash.ui.components.analog.UIAnalogStickSignalProxy;
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentView;
	import org.osflash.ui.signals.ISignalTarget;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicAnalogStickView extends UIGraphicComponentView implements IUIButtonView
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
		private var _config : IUIAnalogStickViewConfig;
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIAnalogStickColourScheme;
		
		/**
		 * @private
		 */
		private var _fillGraphicData : IGraphicsFill;
		
		/**
		 * @private
		 */
		private var _graphicsData : Vector.<IGraphicsData>;
		
		/**
		 * @private
		 */
		private var _graphicPath : GraphicsPath;
		
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
			
			_graphicPath = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
			_graphicsData = new Vector.<IGraphicsData>();
			
			_component = UIAnalogStick(component);
			
			_container = _component.displayObjectContainer;
			_container.addChild(_background = new Shape());
			
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
			
			if(null != _signalProxy)
			{
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
			point = _container.globalToLocal(point);
			return innerBounds.containsPoint(point) ? _component : null;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function resizeTo(width : int, height : int) : void
		{
			super.resizeTo(width, height);
			
			_graphicPath.commands.length = 0;
			_graphicPath.data.length = 0;
			
			const bounds : Rectangle = innerBounds;
			_graphicPath.moveTo(bounds.x, bounds.y);
			_graphicPath.lineTo(bounds.x + bounds.width, bounds.y);
			_graphicPath.lineTo(bounds.x + bounds.width, bounds.y + bounds.height);
			_graphicPath.lineTo(bounds.x, bounds.y + bounds.height);
			
			repaint();
		}
		
		/**
		 * @private
		 */	
		override protected function initConfig(config : IUIComponentViewConfig) : void
		{
			super.initConfig(config);
			
			_colourScheme = _config.colourScheme;
		}
		
		/**
		 * @private
		 */
		protected function repaint() : void
		{
			const graphics : Graphics = _background.graphics;
			
			_graphicsData.length = 0;
			_graphicsData.push(_fillGraphicData);
			_graphicsData.push(_graphicPath);
			
			graphics.clear();
			graphics.drawGraphicsData(_graphicsData);
		}
	}
}
