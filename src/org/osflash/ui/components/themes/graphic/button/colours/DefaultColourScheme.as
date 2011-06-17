package org.osflash.ui.components.themes.graphic.button.colours
{
	import flash.display.GraphicsSolidFill;
	import flash.display.IGraphicsFill;
	import org.osflash.ui.components.themes.graphic.button.IUIButtonColourScheme;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DefaultColourScheme implements IUIButtonColourScheme
	{

		/**
		 * @private
		 */
		private var _up : IGraphicsFill;
		
		/**
		 * @private
		 */
		private var _over : IGraphicsFill;
		
		/**
		 * @private
		 */
		private var _down : IGraphicsFill;

		public function DefaultColourScheme()
		{
			_up = new GraphicsSolidFill(0xbb00bb, 0.5);
			_over = new GraphicsSolidFill(0xff00ff, 0.5);
			_down = new GraphicsSolidFill(0xffffff, 0.75);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get up() : IGraphicsFill { return _up; }

		/**
		 * @inheritDoc
		 */
		public function get over() : IGraphicsFill { return _over; }
		
		/**
		 * @inheritDoc
		 */
		public function get down() : IGraphicsFill { return _down; }
	}
}
