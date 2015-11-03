// ORM class for table 'VDN_AVLB_DAILY'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Tue Jul 21 16:05:16 CST 2015
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class VDN_AVLB_DAILY extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private String ERR;
  public String get_ERR() {
    return ERR;
  }
  public void set_ERR(String ERR) {
    this.ERR = ERR;
  }
  public VDN_AVLB_DAILY with_ERR(String ERR) {
    this.ERR = ERR;
    return this;
  }
  private Long TOTAL;
  public Long get_TOTAL() {
    return TOTAL;
  }
  public void set_TOTAL(Long TOTAL) {
    this.TOTAL = TOTAL;
  }
  public VDN_AVLB_DAILY with_TOTAL(Long TOTAL) {
    this.TOTAL = TOTAL;
    return this;
  }
  private String DS;
  public String get_DS() {
    return DS;
  }
  public void set_DS(String DS) {
    this.DS = DS;
  }
  public VDN_AVLB_DAILY with_DS(String DS) {
    this.DS = DS;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof VDN_AVLB_DAILY)) {
      return false;
    }
    VDN_AVLB_DAILY that = (VDN_AVLB_DAILY) o;
    boolean equal = true;
    equal = equal && (this.ERR == null ? that.ERR == null : this.ERR.equals(that.ERR));
    equal = equal && (this.TOTAL == null ? that.TOTAL == null : this.TOTAL.equals(that.TOTAL));
    equal = equal && (this.DS == null ? that.DS == null : this.DS.equals(that.DS));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof VDN_AVLB_DAILY)) {
      return false;
    }
    VDN_AVLB_DAILY that = (VDN_AVLB_DAILY) o;
    boolean equal = true;
    equal = equal && (this.ERR == null ? that.ERR == null : this.ERR.equals(that.ERR));
    equal = equal && (this.TOTAL == null ? that.TOTAL == null : this.TOTAL.equals(that.TOTAL));
    equal = equal && (this.DS == null ? that.DS == null : this.DS.equals(that.DS));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.ERR = JdbcWritableBridge.readString(1, __dbResults);
    this.TOTAL = JdbcWritableBridge.readLong(2, __dbResults);
    this.DS = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.ERR = JdbcWritableBridge.readString(1, __dbResults);
    this.TOTAL = JdbcWritableBridge.readLong(2, __dbResults);
    this.DS = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(ERR, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeLong(TOTAL, 2 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(DS, 3 + __off, 12, __dbStmt);
    return 3;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(ERR, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeLong(TOTAL, 2 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(DS, 3 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.ERR = null;
    } else {
    this.ERR = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.TOTAL = null;
    } else {
    this.TOTAL = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.DS = null;
    } else {
    this.DS = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.ERR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERR);
    }
    if (null == this.TOTAL) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.TOTAL);
    }
    if (null == this.DS) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DS);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.ERR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERR);
    }
    if (null == this.TOTAL) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.TOTAL);
    }
    if (null == this.DS) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DS);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(ERR==null?"null":ERR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TOTAL==null?"null":"" + TOTAL, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DS==null?"null":DS, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(ERR==null?"null":ERR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TOTAL==null?"null":"" + TOTAL, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DS==null?"null":DS, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 9, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERR = null; } else {
      this.ERR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.TOTAL = null; } else {
      this.TOTAL = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DS = null; } else {
      this.DS = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERR = null; } else {
      this.ERR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.TOTAL = null; } else {
      this.TOTAL = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DS = null; } else {
      this.DS = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    VDN_AVLB_DAILY o = (VDN_AVLB_DAILY) super.clone();
    return o;
  }

  public void clone0(VDN_AVLB_DAILY o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("ERR", this.ERR);
    __sqoop$field_map.put("TOTAL", this.TOTAL);
    __sqoop$field_map.put("DS", this.DS);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("ERR", this.ERR);
    __sqoop$field_map.put("TOTAL", this.TOTAL);
    __sqoop$field_map.put("DS", this.DS);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("ERR".equals(__fieldName)) {
      this.ERR = (String) __fieldVal;
    }
    else    if ("TOTAL".equals(__fieldName)) {
      this.TOTAL = (Long) __fieldVal;
    }
    else    if ("DS".equals(__fieldName)) {
      this.DS = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
  public boolean setField0(String __fieldName, Object __fieldVal) {
    if ("ERR".equals(__fieldName)) {
      this.ERR = (String) __fieldVal;
      return true;
    }
    else    if ("TOTAL".equals(__fieldName)) {
      this.TOTAL = (Long) __fieldVal;
      return true;
    }
    else    if ("DS".equals(__fieldName)) {
      this.DS = (String) __fieldVal;
      return true;
    }
    else {
      return false;    }
  }
}
