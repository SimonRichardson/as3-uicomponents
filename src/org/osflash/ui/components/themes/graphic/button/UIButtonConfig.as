package org.osflash.ui.components.themes.graphic.button
{
	import org.osflash.ui.components.text.IUILabelView;
	import org.osflash.ui.components.themes.graphic.button.colours.UIButtonDefaultColourScheme;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;
	import org.osflash.ui.components.themes.graphic.text.UILabelView;
	import org.osflash.ui.components.themes.graphic.text.UILabelViewConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIButtonConfig extends UIGraphicComponentConfig 
												implements IUIButtonViewConfig
	{
		
		private static const DEFAULT_RADIUS : int = 6;
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIButtonColourScheme;
		
		private var _radius : int;
		
		public function UIButtonConfig(colourScheme : IUIButtonColourScheme = null)
		{
			_colourScheme = colourScheme || new UIButtonDefaultColourScheme();
			_radius = DEFAULT_RADIUS;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get colourScheme() : IUIButtonColourScheme
		{
			return _colourScheme;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get labelView() : IUILabelView
		{
			return new UILabelView(new UILabelViewConfig());
		}

		/**
		 * @inheritDoc
		 */
		public function get autoEllipsis() : Boolean { return true; }

		/**
		 * @inheritDoc
		 */
		public function get bindIconToLabel() : Boolean { return true; }

		/**
		 * @inheritDoc
		 */
		public function get cornerTopLeft() : int { return _radius; }

		/**
		 * @inheritDoc
		 */
		public function get cornerTopRight() : int { return _radius; }

		/**
		 * @inheritDoc
		 */
		public function get cornerBottomLeft() : int { return _radius; }

		/**
		 * @inheritDoc
		 */
		public function get cornerBottomRight() : int { return _radius; }
	}
}
