package org.osflash.ui.components.component
{
	import org.osflash.ui.components.errors.AbstractMethodError;
	import org.osflash.ui.components.geom.UIMargin;
	import org.osflash.ui.components.geom.UIPadding;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIComponentView implements IUIComponentView
	{
		
		/**
		 * @private
		 */
		private var _bounds : Rectangle;
		
		/**
		 * @private
		 */
		private var _margin : UIMargin;
		
		/**
		 * @private
		 */
		private var _padding : UIPadding;

		public function UIComponentView()
		{
			_bounds = new Rectangle();
			_margin = new UIMargin();
			_padding = new UIPadding();
		}
		
		/**
		 * @inheritDoc
		 */
		public function bind(component : IUIComponent) : void
		{
			throw new AbstractMethodError();
		}

		/**
		 * @inheritDoc
		 */
		public function unbind() : void
		{
			throw new AbstractMethodError();
		}
		
		/**
		 * @inheritDoc
		 */
		public function captureTarget(point : Point) : ISignalTarget
		{
			return null;
		}
		
		/**
		 * @inheritDoc
		 */
		public function resizeTo(width : int, height : int) : void
		{
			_bounds.width = width;
			_bounds.height = height;
		}

		/**
		 * @inheritDoc
		 */
		public function get bounds() : Rectangle { return _bounds; }
		
		/**
		 * @inheritDoc
		 */
		public function get margin() : UIMargin	{ return _margin; }
		
		/**
		 * @inheritDoc
		 */
		public function get padding() : UIPadding { return _padding; }
	}
}
