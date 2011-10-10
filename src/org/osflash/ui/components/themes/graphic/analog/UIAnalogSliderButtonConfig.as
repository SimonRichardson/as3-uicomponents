package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.text.IUILabelView;
	import org.osflash.ui.components.themes.graphic.analog.colours.UIAnalogSliderButtonDefaultColourScheme;
	import org.osflash.ui.components.themes.graphic.button.IUIButtonColourScheme;
	import org.osflash.ui.components.themes.graphic.button.IUIButtonViewConfig;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogSliderButtonConfig extends UIGraphicComponentConfig 
													implements IUIButtonViewConfig
	{
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIButtonColourScheme;
		
		public function UIAnalogSliderButtonConfig(colourScheme : IUIButtonColourScheme = null)
		{
			_colourScheme = colourScheme || new UIAnalogSliderButtonDefaultColourScheme();
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
		public function get labelView() : IUILabelView { return null; }

		/**
		 * @inheritDoc
		 */
		public function get autoEllipsis() : Boolean { return false; }

		/**
		 * @inheritDoc
		 */
		public function get bindIconToLabel() : Boolean { return false; }

		/**
		 * @inheritDoc
		 */
		public function get cornerTopLeft() : int { return 0; }

		/**
		 * @inheritDoc
		 */
		public function get cornerTopRight() : int { return 0; }

		/**
		 * @inheritDoc
		 */
		public function get cornerBottomLeft() : int { return 0; }

		/**
		 * @inheritDoc
		 */
		public function get cornerBottomRight() : int { return 0; }
	}
}
