package org.osflash.ui.components.button.graphic
{
	import org.osflash.logger.utils.debug;
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.button.UIButton;
	import org.osflash.ui.components.button.UIButtonSignalProxy;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.graphic.UIGraphicComponentView;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Point;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicButtonView extends UIGraphicComponentView implements IUIButtonView
	{
		
		/**
		 * @private
		 */
		private var _component : UIButton;
		
		/**
		 * @private
		 */
		private var _container :  DisplayObjectContainer;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIButtonSignalProxy;
		
		/**
		 * @private
		 */
		private var _background : Shape;
		
		/**
		 * @private
		 */
		private var _colour : int;
				
		public function UIGraphicButtonView()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function bind(component : IUIComponent) : void
		{
			super.bind(component);
			
			_component = UIButton(component);
			
			_container = _component.displayObjectContainer;
			_container.addChild(_background = new Shape());

			_signalProxy = UIButtonSignalProxy(_component.signalProxy);
			_signalProxy.textChanged.add(handleTextUpdateSignal);
			_signalProxy.enabled.add(handleEnabledSignal);
			_signalProxy.hovered.add(handleHoveredSignal);
			_signalProxy.focused.add(handleFocusedSignal);
			_signalProxy.pressed.add(handlePressedSignal);
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
				_signalProxy.textChanged.remove(handleTextUpdateSignal);
				_signalProxy.enabled.remove(handleEnabledSignal);
				_signalProxy.hovered.remove(handleHoveredSignal);
				_signalProxy.focused.remove(handleFocusedSignal);
				_signalProxy.pressed.remove(handlePressedSignal);
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
			return bounds.containsPoint(point) ? _component : null;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function resizeTo(width : int, height : int) : void
		{
			super.resizeTo(width, height);
			
			repaint();
		}
		
		/**
		 * @private
		 */
		protected function repaint() : void
		{
			const graphics : Graphics = _background.graphics;
			graphics.clear();
			graphics.beginFill(_colour);
			graphics.drawRect(bounds.x, bounds.y, bounds.width, bounds.height);
			graphics.endFill();
		}
		
		/**
		 * @private
		 */
		private function handleTextUpdateSignal(value : String) : void
		{
			
		}
		
		/**
		 * @private
		 */
		private function handleEnabledSignal(value : Boolean) : void
		{
			
		}
		
		/**
		 * @private
		 */
		private function handleHoveredSignal(value : Boolean) : void
		{
			debug("here", value);
			
			_colour = value ? 0xff00ff : 0xaa00aa;
			
			repaint();
		}
		
		/**
		 * @private
		 */
		private function handleFocusedSignal(value : Boolean) : void
		{
			
		}
		
		/**
		 * @private
		 */
		private function handlePressedSignal(value : Boolean) : void
		{
			
		}
	}
}
