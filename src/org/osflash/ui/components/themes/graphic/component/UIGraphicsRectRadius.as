package org.osflash.ui.components.themes.graphic.component
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UIGraphicsRectRadius
	{
		
		/**
		 * @private
		 */
		private var _topLeft : int;

		/**
		 * @private
		 */
		private var _topRight : int;

		/**
		 * @private
		 */
		private var _bottomLeft : int;

		/**
		 * @private
		 */
		private var _bottomRight : int;

		public function UIGraphicsRectRadius(	topLeft : int = 0, 
											topRight : int = 0, 
											bottomLeft : int = 0, 
											bottomRight : int = 0
											)
		{
			_topLeft = topLeft;
			_topRight = topRight;
			_bottomLeft = bottomLeft;
			_bottomRight = bottomRight;
		}
		
		public function setValues(	topLeft : int, 
									topRight : int, 
									bottomLeft : int, 
									bottomRight : int
									) : void
		{
			_topLeft = topLeft;
			_topRight = topRight;
			_bottomLeft = bottomLeft;
			_bottomRight = bottomRight;
		}

		public function get topLeft() : int { return _topLeft; }
		public function set topLeft(value : int) : void { _topLeft = value; }

		public function get topRight() : int { return _topRight; }
		public function set topRight(value : int) : void { _topRight = value; }

		public function get bottomLeft() : int { return _bottomLeft; }
		public function set bottomLeft(value : int) : void { _bottomLeft = value; }

		public function get bottomRight() : int { return _bottomRight; }
		public function set bottomRight(value : int) : void { _bottomRight = value; }
	}
}
