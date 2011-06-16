package org.osflash.ui.components.component
{
	import org.osflash.ui.components.geom.UIMargin;
	import org.osflash.ui.components.geom.UIPadding;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.geom.Point;
	import flash.geom.Rectangle;
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
		
		function get margin() : UIMargin;
		
		function get padding() : UIPadding;
	}
}
