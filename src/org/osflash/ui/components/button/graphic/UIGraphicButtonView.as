package org.osflash.ui.components.button.graphic
{
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.button.UIButton;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.graphic.UIGraphicComponentView;
	import org.osflash.ui.signals.ISignalTarget;

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
		
		public function UIGraphicButtonView()
		{
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function bind(component : IUIComponent) : void
		{
			super.bind(component);
			
			_component = UIButton(component);
			_component.signals.mouseInSignal.add(handleMouseInSignal);
			_component.signals.mouseOutSignal.add(handleMouseOutSignal);
			_component.signals.mouseDownSignal.add(handleMouseDownSignal);
			_component.signals.mouseUpSignal.add(handleMouseUpSignal);
		}
				
		/**
		 * @inheritDoc
		 */	
		override public function unbind() : void
		{
			_component = null;
			
			super.unbind();
		}
		
		/**
		 * @private
		 */
		private function handleMouseInSignal(	target : ISignalTarget, 
												mousePos : Point, 
												mouseDown : Boolean
												) : void
		{
			
		}
		
		/**
		 * @private
		 */
		private function handleMouseOutSignal(	target : ISignalTarget, 
												mousePos : Point, 
												mouseDown : Boolean
												) : void
		{
			
		}
		
		/**
		 * @private
		 */
		private function handleMouseDownSignal(	target : ISignalTarget, 
												mousePos : Point 
												) : void
		{
			
		}
		
		/**
		 * @private
		 */
		private function handleMouseUpSignal(	target : ISignalTarget, 
												mousePos : Point 
												) : void
		{
			
		}
	}
}
