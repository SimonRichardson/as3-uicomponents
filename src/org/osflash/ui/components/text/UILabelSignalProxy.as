package org.osflash.ui.components.text
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.ui.components.component.UIComponentSignalProxy;

	import flash.display.BitmapData;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UILabelSignalProxy extends UIComponentSignalProxy
	{
		
		private const _textChanged : ISignal = new Signal(String);
		
		private const _iconChanged : ISignal = new Signal(BitmapData);
		
		public function get textChanged() : ISignal { return _textChanged; }
		
		public function get iconChanged() : ISignal { return _iconChanged; }
	}
}
