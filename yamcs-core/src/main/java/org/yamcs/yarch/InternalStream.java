package org.yamcs.yarch;

public class InternalStream extends AbstractStream {

    public InternalStream(YarchDatabase dict, String name, TupleDefinition definition) {
        super(dict, name, definition);
    }

    @Override
    protected void doClose() {
    }

    @Override
    public void start() {
    }
}
