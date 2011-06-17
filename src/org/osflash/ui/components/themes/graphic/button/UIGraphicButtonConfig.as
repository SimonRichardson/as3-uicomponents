package org.osflash.ui.components.themes.graphic.button
{
	import org.osflash.ui.components.themes.graphic.button.colours.DefaultColourScheme;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicButtonConfig extends UIGraphicComponentConfig 
												implements IUIButtonViewConfig
	{
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIButtonColourScheme;
		
		public function UIGraphicButtonConfig(colourScheme : IUIButtonColourScheme = null)
		{
			_colourScheme = colourScheme || new DefaultColourScheme();
		}
		
		/**
		 * @inheritDoc
		 */
		public function get colourScheme() : IUIButtonColourScheme
		{
			return _colourScheme;
		}
	}
}
