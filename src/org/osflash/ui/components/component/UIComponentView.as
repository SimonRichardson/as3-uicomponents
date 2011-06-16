package org.osflash.ui.components.component
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.osflash.ui.errors.AbstractMethodError;
	import org.osflash.ui.geom.UIMargin;
	import org.osflash.ui.geom.UIPadding;
	import org.osflash.ui.signals.ISignalTarget;

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
		private var _innerBounds : Rectangle;
		
		/**
		 * @private
		 */
		private var _outerBounds : Rectangle;
		
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
			_innerBounds = new Rectangle();
			_outerBounds = new Rectangle();
			
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
			_bounds.x = 0;
			_bounds.y = 0;
			_bounds.width = width;
			_bounds.height = height;
			
			_innerBounds.x = _padding.left;
			_innerBounds.y = _padding.top;
			_innerBounds.width = width - (_padding.left + _padding.right);
			_innerBounds.height = height - (_padding.top + _padding.bottom);
			
			_outerBounds.x = -_margin.left;
			_outerBounds.y = -_margin.top;
			_outerBounds.width = width + (_margin.left + _margin.right);
			_outerBounds.height = height + (_margin.top + _margin.bottom);
		}

		/**
		 * @inheritDoc
		 */
		public function get bounds() : Rectangle { return _bounds; }
		
		/**
		 * @inheritDoc
		 */
		public function get innerBounds() : Rectangle { return _innerBounds; }
		
		/**
		 * @inheritDoc
		 */
		public function get outerBounds() : Rectangle { return _outerBounds; }
		
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
