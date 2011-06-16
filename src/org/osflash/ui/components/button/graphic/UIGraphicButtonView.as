package org.osflash.ui.components.button.graphic
{
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.button.UIButton;
	import org.osflash.ui.components.button.UIButtonSignalProxy;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.graphic.UIGraphicComponentView;

	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Shape;
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
		private var _signalProxy : UIButtonSignalProxy;
		
		/**
		 * @private
		 */
		private var _background : Shape;
		
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
			
			const container : DisplayObjectContainer = _component.displayObjectContainer;
			container.addChild(_background = new Shape());

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
			
			if(null != _background.parent)
				_background.parent.removeChild(_background);
			_background = null;
			
			_signalProxy.textChanged.remove(handleTextUpdateSignal);
			_signalProxy.enabled.remove(handleEnabledSignal);
			_signalProxy.hovered.remove(handleHoveredSignal);
			_signalProxy.focused.remove(handleFocusedSignal);
			_signalProxy.pressed.remove(handlePressedSignal);
			_signalProxy = null;
			
			super.unbind();
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
			graphics.beginFill(0xff00ff);
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
