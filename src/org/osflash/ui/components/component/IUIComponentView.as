package org.osflash.ui.components.component
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.osflash.ui.geom.UIMargin;
	import org.osflash.ui.geom.UIPadding;
	import org.osflash.ui.signals.ISignalTarget;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIComponentView
	{
		
		function bind(component : IUIComponent) : void;
		function unbind() : void;
		
		function captureTarget(point : Point) : ISignalTarget;
		
		function resizeTo(width : int, height : int) : void;
		
		function get bounds() : Rectangle;
		
		function get innerBounds() : Rectangle;
		
		function get outerBounds() : Rectangle;
		
		function get margin() : UIMargin;
		
		function get padding() : UIPadding;
	}
}
