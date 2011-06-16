package org.osflash.ui.components.component
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIComponentSignalProxy implements IUIComponentSignalProxy
	{
		
		/**
		 * @private
		 */
		private const _enabled : ISignal = new Signal(Boolean);
		
		/**
		 * @private
		 */
		private const _hovered : ISignal = new Signal(Boolean);
		
		/**
		 * @private
		 */
		private const _focused : ISignal = new Signal(Boolean);
		
		/**
		 * @private
		 */
		private const _pressed : ISignal = new Signal(Boolean);
		
		/**
		 * @private
		 */
		private const _action : ISignal = new Signal(int);
		
		/**
		 * @inheritDoc
		 */
		public function get enabled() : ISignal { return _enabled; }
		
		/**
		 * @inheritDoc
		 */
		public function get hovered() : ISignal { return _hovered; }
		
		/**
		 * @inheritDoc
		 */
		public function get focused() : ISignal { return _focused; }
		
		/**
		 * @inheritDoc
		 */
		public function get pressed() : ISignal { return _pressed; }
		
		/**
		 * @inheritDoc
		 */
		public function get action() : ISignal { return _action; }
	}
}
