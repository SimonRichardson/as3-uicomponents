package org.osflash.ui.components.button.graphic
{
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.button.UIButton;
	import org.osflash.ui.components.button.UIButtonSignalProxy;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.graphic.UIGraphicComponentView;
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
			_signalProxy = null;
			
			super.unbind();
		}
		
		/**
		 * @private
		 */
		protected function repaint() : void
		{
			
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
