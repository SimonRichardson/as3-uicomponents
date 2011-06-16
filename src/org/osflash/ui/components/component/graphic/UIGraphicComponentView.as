package org.osflash.ui.components.component.graphic
{
	import org.osflash.ui.components.component.IUIComponent;
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
					component.pressed = mouseDown;
					component.hovered = true;
				}
			}
			
			mousePos;
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
					component.pressed = mouseDown;
					component.hovered = false;
				}
			}
			
			mousePos;
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
					component.hovered = false;
					component.pressed = true;
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
					component.hovered = false;
					component.pressed = false;
				}
			}
			
			mousePos;
		}
	}
}
