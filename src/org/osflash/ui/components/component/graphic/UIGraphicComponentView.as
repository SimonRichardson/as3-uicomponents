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
	}
}
