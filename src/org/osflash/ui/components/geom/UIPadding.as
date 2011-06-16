package org.osflash.ui.components.geom
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UIPadding
	{
		
		/**
		 * @private
		 */
		private var _top : int;

		/**
		 * @private
		 */
		private var _right : int;

		/**
		 * @private
		 */
		private var _bottom : int;

		/**
		 * @private
		 */
		private var _left : int;

		public function UIPadding(	top : int = 0, 
									right : int = 0, 
									bottom : int = 0, 
									left : int = 0
									)
		{
			_top = top;
			_right = right;
			_bottom = bottom;
			_left = left;
		}

		public function get top() : int { return _top; }
		public function set top(value : int) : void { _top = value; }

		public function get right() : int { return _right; }
		public function set right(value : int) : void { _right = value; }

		public function get bottom() : int { return _bottom; }
		public function set bottom(value : int) : void { _bottom = value; }

		public function get left() : int { return _left; }
		public function set left(value : int) : void { _left = value; }

		public function toString() : String
		{
			return "[UIPadding (top:" + top + 
								", right:" + right + 
								", bottom:" + bottom + 
								", left:" + left + 
								")]";
		}
	}
}
