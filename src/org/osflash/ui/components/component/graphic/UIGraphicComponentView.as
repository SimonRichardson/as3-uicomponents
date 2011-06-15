package org.osflash.ui.components.component.graphic
{
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.IUIComponentView;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.geom.Point;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicComponentView implements IUIComponentView
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
		public function bind(component : IUIComponent) : void
		{
			if (null == component) throw new ArgumentError('IUIComponent can not be null');

			_component = component;
			
			_component.signals.mouseInSignal.add(handleMouseInSignal);
			_component.signals.mouseOutSignal.add(handleMouseOutSignal);
			_component.signals.mouseDownSignal.add(handleMouseDownSignal);
			_component.signals.mouseUpSignal.add(handleMouseUpSignal);
		}

		/**
		 * @inheritDoc
		 */
		public function unbind() : void
		{
			_component = null;
		}

		/**
		 * @inheritDoc
		 */
		public function captureTarget(point : Point) : ISignalTarget
		{
			return null;
		}
		
				
		/**
		 * @private
		 */
		protected function handleMouseInSignal(	target : ISignalTarget, 
												mousePos : Point, 
												mouseDown : Boolean
												) : void
		{ 
			if(_component.state.enabled)
			{

			}
		}
		
		/**
		 * @private
		 */
		protected function handleMouseOutSignal(	target : ISignalTarget, 
													mousePos : Point, 
													mouseDown : Boolean
													) : void
		{
			if(_component.state.enabled)
			{

			}
		}
		
		/**
		 * @private
		 */
		protected function handleMouseDownSignal(	target : ISignalTarget, 
													mousePos : Point 
													) : void
		{
			if(_component.state.enabled)
			{

			}
		}
		
		/**
		 * @private
		 */
		protected function handleMouseUpSignal(	target : ISignalTarget, 
												mousePos : Point 
												) : void
		{
			if(_component.state.enabled)
			{

			}
		}
	}
}
