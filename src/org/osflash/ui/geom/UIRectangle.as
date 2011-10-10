package org.osflash.ui.geom
{
	import flash.geom.Rectangle;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UIRectangle extends Rectangle
	{

		public function UIRectangle(	x : Number = 0, 
										y : Number = 0, 
										width : Number = 0, 
										height : Number = 0)
		{
			moveTo(x, y);
			resizeTo(width, height);
		}

		public function resizeTo(width : Number, height : Number) : void
		{
			this.width = width < 0 ? 0 : width;
			this.height = height < 0 ? 0 : height;
		}

		public function moveTo(x : Number, y : Number) : void
		{
			this.x = x;
			this.y = y;
		}

		public function setDimensions(	x : Number, 
										y : Number, 
										width : Number, 
										height : Number) : void
		{
			this.x = x;
			this.y = y;
			this.width = width < 0 ? 0 : width;
			this.height = height < 0 ? 0 : height;
		}

		override public function toString() : String
		{
			return "[UIRectangle, x: " + x + 
								", y: " + y + 
								", width: " + width + 
								", height: " + height + 
								"]";
		}
	}
}
