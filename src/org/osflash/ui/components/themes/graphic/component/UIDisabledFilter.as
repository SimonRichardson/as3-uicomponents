package org.osflash.ui.components.themes.graphic.component
{
	import flash.display.DisplayObject;
	import flash.filters.ColorMatrixFilter;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UIDisabledFilter
	{

		private static var _disabledAlphaFilter : ColorMatrixFilter = new ColorMatrixFilter([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0.5]);
		
		/**
		 * Show the enabled state of the display object, this will set the alpha matrix filter
		 * and preserve the filters on the display object.
		 * 
		 * @param displayObject
		 * @param value True if we should show the enabled state of the view or not.
		 */
		public static function showEnabled(displayObject : DisplayObject, value : Boolean) : void
		{
			const filters : Array = null == displayObject.filters ? [] : displayObject.filters;
			displayObject.filters = value ? filters : filters.concat(_disabledAlphaFilter);
		}
	}
}
