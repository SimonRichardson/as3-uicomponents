package org.osflash.ui.components.themes.graphic.component
{
	import org.osflash.ui.geom.UIMargin;
	import org.osflash.ui.geom.UIPadding;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicComponentConfig implements IUIComponentViewConfig
	{
		
		/**
		 * @private
		 */
		private var _margin : UIMargin;
		
		/**
		 * @private
		 */
		private var _padding : UIPadding;

		public function UIGraphicComponentConfig()
		{
			_margin = new UIMargin();
			_padding = new UIPadding();
		}
		
		/**
		 * @inheritDoc
		 */
		public function get margin() : UIMargin { return _margin; }

		/**
		 * @inheritDoc
		 */
		public function get padding() : UIPadding { return _padding; }
	}
}
