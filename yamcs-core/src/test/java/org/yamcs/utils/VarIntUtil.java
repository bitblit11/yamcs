package org.yamcs.utils;

public class VarIntUtil {
    
    
    /**
     * Encodes x as varint in the buffer at position pos and returns the new position
     * 
     * @param buf
     * @param x
     * @return
     */
    static public int encode(byte[] buf, int pos, int x) {
        while ((x & ~0x7F) != 0) {
            buf[pos++] = ((byte)((x & 0x7F) | 0x80));
            x >>>= 7;
        }
        buf[pos++] = (byte)(x & 0x7F);
        
        return pos;
    }
    
    
    /**
     * decodes an array of varints
     * 
     * @author nm
     *
     */
    public static class ArrayDecoder {
        int pos=0; 
        final byte[] buf;
        private ArrayDecoder(byte[] buf) {
            this.buf = buf;
        }
        
        /**
         * Returns true if the array contains another element. 
         *  If the array is corrupted, this will return true and next() will throw an BufferOverflow exception
         * @return
         */
        public boolean hasNext() {
            return pos < buf.length;
        }
        
        public int next() {
            byte b = buf[pos++];
            int v = b &0x7F;
            for (int shift = 7; (b & 0x80) != 0; shift += 7) {
                b = buf[pos++];
                v |= (b & 0x7F) << shift;
            }
            return v;
        }
    }
    
    static public ArrayDecoder newArrayDecoder(byte[] buf) {
        return new ArrayDecoder(buf);
    }
}