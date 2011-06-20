package org.osflash.ui.components.themes.graphic.component
{
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentStateAction;
	import org.osflash.ui.components.component.UIComponentView;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.geom.Point;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicComponentView extends UIComponentView
	{

		/**
		 * @private
		 */
		private static const _graphics : UIGraphics = new UIGraphics();

		/**
		 * @private
		 */
		private var _component : IUIComponent;

		public function UIGraphicComponentView()
		{
		}
		
		/**
		 * @inheritDoc
		 */
		override public function bind(component : IUIComponent) : void
		{
			if (null == component) throw new ArgumentError('IUIComponent can not be null');

			_component = component;
			
			_component.signals.mouseInSignal.add(handleMouseInSignal);
			_component.signals.mouseOutSignal.add(handleMouseOutSignal);
			_component.signals.mouseDownSignal.add(handleMouseDownSignal);
			_component.signals.mouseUpSignal.add(handleMouseUpSignal);
			
			_component.signals.focusOutSignal.add(handleFocusedOutSignal);
		}

		/**
		 * @inheritDoc
		 */
		override public function unbind() : void
		{
			_component = null;
		}
		
		/**
		 * @private
		 */		
		protected function handleFocusedOutSignal(target : ISignalTarget) : void
		{
			if(target is IUIComponent)
			{
				const component : IUIComponent = IUIComponent(target);
				component.state.focused = false;
			}
		}
				
		/**
		 * @private
		 */
		protected function handleMouseInSignal(	target : ISignalTarget, 
												mousePos : Point, 
												mouseDown : Boolean
												) : void
		{
			if(target is IUIComponent)
			{
				const component : IUIComponent = IUIComponent(target);				
				if(component.enabled) 
				{
					component.action |= UIComponentStateAction.HOVERED;
				}
			}
			
			mousePos;
			mouseDown;
		}
		
		/**
		 * @private
		 */
		protected function handleMouseOutSignal(	target : ISignalTarget, 
													mousePos : Point, 
													mouseDown : Boolean
													) : void
		{
			if(target is IUIComponent)
			{
				const component : IUIComponent = IUIComponent(target);				
				if(component.enabled) 
				{
					component.action ^= UIComponentStateAction.HOVERED;
				}
			}
			
			mousePos;
			mouseDown;
		}
		
		/**
		 * @private
		 */
		protected function handleMouseDownSignal(	target : ISignalTarget, 
													mousePos : Point 
													) : void
		{
			if(target is IUIComponent)
			{
				const component : IUIComponent = IUIComponent(target);				
				if(component.enabled) 
				{
					component.action |= UIComponentStateAction.PRESSED;
				}
			}
			
			mousePos;
		}
		
		/**
		 * @private
		 */
		protected function handleMouseUpSignal(	target : ISignalTarget, 
												mousePos : Point 
												) : void
		{
			if(target is IUIComponent)
			{
				const component : IUIComponent = IUIComponent(target);				
				if(component.enabled) 
				{
					component.action ^= UIComponentStateAction.PRESSED;
				}
			}
			
			mousePos;
		}
		
		public function get graphics() : UIGraphics
		{
			return _graphics;
		}
	}
}
