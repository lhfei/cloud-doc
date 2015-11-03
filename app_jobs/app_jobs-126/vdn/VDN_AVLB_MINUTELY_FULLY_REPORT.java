// ORM class for table 'VDN_AVLB_MINUTELY_FULLY_REPORT'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Sun Aug 09 14:04:14 CST 2015
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

public class VDN_AVLB_MINUTELY_FULLY_REPORT extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private String ISP;
  public String get_ISP() {
    return ISP;
  }
  public void set_ISP(String ISP) {
    this.ISP = ISP;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_ISP(String ISP) {
    this.ISP = ISP;
    return this;
  }
  private String CT;
  public String get_CT() {
    return CT;
  }
  public void set_CT(String CT) {
    this.CT = CT;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_CT(String CT) {
    this.CT = CT;
    return this;
  }
  private String TR;
  public String get_TR() {
    return TR;
  }
  public void set_TR(String TR) {
    this.TR = TR;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_TR(String TR) {
    this.TR = TR;
    return this;
  }
  private String CAT;
  public String get_CAT() {
    return CAT;
  }
  public void set_CAT(String CAT) {
    this.CAT = CAT;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_CAT(String CAT) {
    this.CAT = CAT;
    return this;
  }
  private Integer A;
  public Integer get_A() {
    return A;
  }
  public void set_A(Integer A) {
    this.A = A;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_A(Integer A) {
    this.A = A;
    return this;
  }
  private Integer B;
  public Integer get_B() {
    return B;
  }
  public void set_B(Integer B) {
    this.B = B;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_B(Integer B) {
    this.B = B;
    return this;
  }
  private Integer C;
  public Integer get_C() {
    return C;
  }
  public void set_C(Integer C) {
    this.C = C;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_C(Integer C) {
    this.C = C;
    return this;
  }
  private Integer C2;
  public Integer get_C2() {
    return C2;
  }
  public void set_C2(Integer C2) {
    this.C2 = C2;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_C2(Integer C2) {
    this.C2 = C2;
    return this;
  }
  private Integer C3;
  public Integer get_C3() {
    return C3;
  }
  public void set_C3(Integer C3) {
    this.C3 = C3;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_C3(Integer C3) {
    this.C3 = C3;
    return this;
  }
  private Integer C4;
  public Integer get_C4() {
    return C4;
  }
  public void set_C4(Integer C4) {
    this.C4 = C4;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_C4(Integer C4) {
    this.C4 = C4;
    return this;
  }
  private Integer D;
  public Integer get_D() {
    return D;
  }
  public void set_D(Integer D) {
    this.D = D;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_D(Integer D) {
    this.D = D;
    return this;
  }
  private Integer D2;
  public Integer get_D2() {
    return D2;
  }
  public void set_D2(Integer D2) {
    this.D2 = D2;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_D2(Integer D2) {
    this.D2 = D2;
    return this;
  }
  private Integer D3;
  public Integer get_D3() {
    return D3;
  }
  public void set_D3(Integer D3) {
    this.D3 = D3;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_D3(Integer D3) {
    this.D3 = D3;
    return this;
  }
  private Integer E;
  public Integer get_E() {
    return E;
  }
  public void set_E(Integer E) {
    this.E = E;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_E(Integer E) {
    this.E = E;
    return this;
  }
  private Integer F;
  public Integer get_F() {
    return F;
  }
  public void set_F(Integer F) {
    this.F = F;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_F(Integer F) {
    this.F = F;
    return this;
  }
  private Integer F2;
  public Integer get_F2() {
    return F2;
  }
  public void set_F2(Integer F2) {
    this.F2 = F2;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_F2(Integer F2) {
    this.F2 = F2;
    return this;
  }
  private Integer G;
  public Integer get_G() {
    return G;
  }
  public void set_G(Integer G) {
    this.G = G;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_G(Integer G) {
    this.G = G;
    return this;
  }
  private Integer G2;
  public Integer get_G2() {
    return G2;
  }
  public void set_G2(Integer G2) {
    this.G2 = G2;
  }
  public VDN_AVLB_MINUTELY_FULLY_REPORT with_G2(Integer G2) {
    this.G2 = G2;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof VDN_AVLB_MINUTELY_FULLY_REPORT)) {
      return false;
    }
    VDN_AVLB_MINUTELY_FULLY_REPORT that = (VDN_AVLB_MINUTELY_FULLY_REPORT) o;
    boolean equal = true;
    equal = equal && (this.ISP == null ? that.ISP == null : this.ISP.equals(that.ISP));
    equal = equal && (this.CT == null ? that.CT == null : this.CT.equals(that.CT));
    equal = equal && (this.TR == null ? that.TR == null : this.TR.equals(that.TR));
    equal = equal && (this.CAT == null ? that.CAT == null : this.CAT.equals(that.CAT));
    equal = equal && (this.A == null ? that.A == null : this.A.equals(that.A));
    equal = equal && (this.B == null ? that.B == null : this.B.equals(that.B));
    equal = equal && (this.C == null ? that.C == null : this.C.equals(that.C));
    equal = equal && (this.C2 == null ? that.C2 == null : this.C2.equals(that.C2));
    equal = equal && (this.C3 == null ? that.C3 == null : this.C3.equals(that.C3));
    equal = equal && (this.C4 == null ? that.C4 == null : this.C4.equals(that.C4));
    equal = equal && (this.D == null ? that.D == null : this.D.equals(that.D));
    equal = equal && (this.D2 == null ? that.D2 == null : this.D2.equals(that.D2));
    equal = equal && (this.D3 == null ? that.D3 == null : this.D3.equals(that.D3));
    equal = equal && (this.E == null ? that.E == null : this.E.equals(that.E));
    equal = equal && (this.F == null ? that.F == null : this.F.equals(that.F));
    equal = equal && (this.F2 == null ? that.F2 == null : this.F2.equals(that.F2));
    equal = equal && (this.G == null ? that.G == null : this.G.equals(that.G));
    equal = equal && (this.G2 == null ? that.G2 == null : this.G2.equals(that.G2));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof VDN_AVLB_MINUTELY_FULLY_REPORT)) {
      return false;
    }
    VDN_AVLB_MINUTELY_FULLY_REPORT that = (VDN_AVLB_MINUTELY_FULLY_REPORT) o;
    boolean equal = true;
    equal = equal && (this.ISP == null ? that.ISP == null : this.ISP.equals(that.ISP));
    equal = equal && (this.CT == null ? that.CT == null : this.CT.equals(that.CT));
    equal = equal && (this.TR == null ? that.TR == null : this.TR.equals(that.TR));
    equal = equal && (this.CAT == null ? that.CAT == null : this.CAT.equals(that.CAT));
    equal = equal && (this.A == null ? that.A == null : this.A.equals(that.A));
    equal = equal && (this.B == null ? that.B == null : this.B.equals(that.B));
    equal = equal && (this.C == null ? that.C == null : this.C.equals(that.C));
    equal = equal && (this.C2 == null ? that.C2 == null : this.C2.equals(that.C2));
    equal = equal && (this.C3 == null ? that.C3 == null : this.C3.equals(that.C3));
    equal = equal && (this.C4 == null ? that.C4 == null : this.C4.equals(that.C4));
    equal = equal && (this.D == null ? that.D == null : this.D.equals(that.D));
    equal = equal && (this.D2 == null ? that.D2 == null : this.D2.equals(that.D2));
    equal = equal && (this.D3 == null ? that.D3 == null : this.D3.equals(that.D3));
    equal = equal && (this.E == null ? that.E == null : this.E.equals(that.E));
    equal = equal && (this.F == null ? that.F == null : this.F.equals(that.F));
    equal = equal && (this.F2 == null ? that.F2 == null : this.F2.equals(that.F2));
    equal = equal && (this.G == null ? that.G == null : this.G.equals(that.G));
    equal = equal && (this.G2 == null ? that.G2 == null : this.G2.equals(that.G2));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.ISP = JdbcWritableBridge.readString(1, __dbResults);
    this.CT = JdbcWritableBridge.readString(2, __dbResults);
    this.TR = JdbcWritableBridge.readString(3, __dbResults);
    this.CAT = JdbcWritableBridge.readString(4, __dbResults);
    this.A = JdbcWritableBridge.readInteger(5, __dbResults);
    this.B = JdbcWritableBridge.readInteger(6, __dbResults);
    this.C = JdbcWritableBridge.readInteger(7, __dbResults);
    this.C2 = JdbcWritableBridge.readInteger(8, __dbResults);
    this.C3 = JdbcWritableBridge.readInteger(9, __dbResults);
    this.C4 = JdbcWritableBridge.readInteger(10, __dbResults);
    this.D = JdbcWritableBridge.readInteger(11, __dbResults);
    this.D2 = JdbcWritableBridge.readInteger(12, __dbResults);
    this.D3 = JdbcWritableBridge.readInteger(13, __dbResults);
    this.E = JdbcWritableBridge.readInteger(14, __dbResults);
    this.F = JdbcWritableBridge.readInteger(15, __dbResults);
    this.F2 = JdbcWritableBridge.readInteger(16, __dbResults);
    this.G = JdbcWritableBridge.readInteger(17, __dbResults);
    this.G2 = JdbcWritableBridge.readInteger(18, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.ISP = JdbcWritableBridge.readString(1, __dbResults);
    this.CT = JdbcWritableBridge.readString(2, __dbResults);
    this.TR = JdbcWritableBridge.readString(3, __dbResults);
    this.CAT = JdbcWritableBridge.readString(4, __dbResults);
    this.A = JdbcWritableBridge.readInteger(5, __dbResults);
    this.B = JdbcWritableBridge.readInteger(6, __dbResults);
    this.C = JdbcWritableBridge.readInteger(7, __dbResults);
    this.C2 = JdbcWritableBridge.readInteger(8, __dbResults);
    this.C3 = JdbcWritableBridge.readInteger(9, __dbResults);
    this.C4 = JdbcWritableBridge.readInteger(10, __dbResults);
    this.D = JdbcWritableBridge.readInteger(11, __dbResults);
    this.D2 = JdbcWritableBridge.readInteger(12, __dbResults);
    this.D3 = JdbcWritableBridge.readInteger(13, __dbResults);
    this.E = JdbcWritableBridge.readInteger(14, __dbResults);
    this.F = JdbcWritableBridge.readInteger(15, __dbResults);
    this.F2 = JdbcWritableBridge.readInteger(16, __dbResults);
    this.G = JdbcWritableBridge.readInteger(17, __dbResults);
    this.G2 = JdbcWritableBridge.readInteger(18, __dbResults);
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
    JdbcWritableBridge.writeString(ISP, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CT, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(TR, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CAT, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(A, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(B, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(C, 7 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(C2, 8 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(C3, 9 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(C4, 10 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(D, 11 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(D2, 12 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(D3, 13 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(E, 14 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(F, 15 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(F2, 16 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(G, 17 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(G2, 18 + __off, 4, __dbStmt);
    return 18;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(ISP, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CT, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(TR, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CAT, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(A, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(B, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(C, 7 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(C2, 8 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(C3, 9 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(C4, 10 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(D, 11 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(D2, 12 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(D3, 13 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(E, 14 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(F, 15 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(F2, 16 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(G, 17 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(G2, 18 + __off, 4, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.ISP = null;
    } else {
    this.ISP = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CT = null;
    } else {
    this.CT = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.TR = null;
    } else {
    this.TR = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CAT = null;
    } else {
    this.CAT = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.A = null;
    } else {
    this.A = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.B = null;
    } else {
    this.B = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.C = null;
    } else {
    this.C = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.C2 = null;
    } else {
    this.C2 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.C3 = null;
    } else {
    this.C3 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.C4 = null;
    } else {
    this.C4 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.D = null;
    } else {
    this.D = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.D2 = null;
    } else {
    this.D2 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.D3 = null;
    } else {
    this.D3 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.E = null;
    } else {
    this.E = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.F = null;
    } else {
    this.F = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.F2 = null;
    } else {
    this.F2 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.G = null;
    } else {
    this.G = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.G2 = null;
    } else {
    this.G2 = Integer.valueOf(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.ISP) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ISP);
    }
    if (null == this.CT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CT);
    }
    if (null == this.TR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, TR);
    }
    if (null == this.CAT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CAT);
    }
    if (null == this.A) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A);
    }
    if (null == this.B) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.B);
    }
    if (null == this.C) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.C);
    }
    if (null == this.C2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.C2);
    }
    if (null == this.C3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.C3);
    }
    if (null == this.C4) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.C4);
    }
    if (null == this.D) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.D);
    }
    if (null == this.D2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.D2);
    }
    if (null == this.D3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.D3);
    }
    if (null == this.E) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.E);
    }
    if (null == this.F) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.F);
    }
    if (null == this.F2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.F2);
    }
    if (null == this.G) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.G);
    }
    if (null == this.G2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.G2);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.ISP) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ISP);
    }
    if (null == this.CT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CT);
    }
    if (null == this.TR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, TR);
    }
    if (null == this.CAT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CAT);
    }
    if (null == this.A) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A);
    }
    if (null == this.B) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.B);
    }
    if (null == this.C) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.C);
    }
    if (null == this.C2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.C2);
    }
    if (null == this.C3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.C3);
    }
    if (null == this.C4) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.C4);
    }
    if (null == this.D) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.D);
    }
    if (null == this.D2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.D2);
    }
    if (null == this.D3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.D3);
    }
    if (null == this.E) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.E);
    }
    if (null == this.F) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.F);
    }
    if (null == this.F2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.F2);
    }
    if (null == this.G) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.G);
    }
    if (null == this.G2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.G2);
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
    __sb.append(FieldFormatter.escapeAndEnclose(ISP==null?"null":ISP, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CT==null?"null":CT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TR==null?"null":TR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CAT==null?"null":CAT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A==null?"null":"" + A, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(B==null?"null":"" + B, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(C==null?"null":"" + C, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(C2==null?"null":"" + C2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(C3==null?"null":"" + C3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(C4==null?"null":"" + C4, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(D==null?"null":"" + D, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(D2==null?"null":"" + D2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(D3==null?"null":"" + D3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(E==null?"null":"" + E, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(F==null?"null":"" + F, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(F2==null?"null":"" + F2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(G==null?"null":"" + G, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(G2==null?"null":"" + G2, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(ISP==null?"null":ISP, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CT==null?"null":CT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TR==null?"null":TR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CAT==null?"null":CAT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A==null?"null":"" + A, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(B==null?"null":"" + B, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(C==null?"null":"" + C, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(C2==null?"null":"" + C2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(C3==null?"null":"" + C3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(C4==null?"null":"" + C4, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(D==null?"null":"" + D, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(D2==null?"null":"" + D2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(D3==null?"null":"" + D3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(E==null?"null":"" + E, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(F==null?"null":"" + F, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(F2==null?"null":"" + F2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(G==null?"null":"" + G, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(G2==null?"null":"" + G2, delimiters));
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
    if (__cur_str.equals("\\N")) { this.ISP = null; } else {
      this.ISP = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.CT = null; } else {
      this.CT = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.TR = null; } else {
      this.TR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.CAT = null; } else {
      this.CAT = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.A = null; } else {
      this.A = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.B = null; } else {
      this.B = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.C = null; } else {
      this.C = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.C2 = null; } else {
      this.C2 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.C3 = null; } else {
      this.C3 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.C4 = null; } else {
      this.C4 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.D = null; } else {
      this.D = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.D2 = null; } else {
      this.D2 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.D3 = null; } else {
      this.D3 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.E = null; } else {
      this.E = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.F = null; } else {
      this.F = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.F2 = null; } else {
      this.F2 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.G = null; } else {
      this.G = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.G2 = null; } else {
      this.G2 = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.ISP = null; } else {
      this.ISP = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.CT = null; } else {
      this.CT = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.TR = null; } else {
      this.TR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.CAT = null; } else {
      this.CAT = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.A = null; } else {
      this.A = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.B = null; } else {
      this.B = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.C = null; } else {
      this.C = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.C2 = null; } else {
      this.C2 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.C3 = null; } else {
      this.C3 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.C4 = null; } else {
      this.C4 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.D = null; } else {
      this.D = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.D2 = null; } else {
      this.D2 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.D3 = null; } else {
      this.D3 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.E = null; } else {
      this.E = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.F = null; } else {
      this.F = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.F2 = null; } else {
      this.F2 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.G = null; } else {
      this.G = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.G2 = null; } else {
      this.G2 = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    VDN_AVLB_MINUTELY_FULLY_REPORT o = (VDN_AVLB_MINUTELY_FULLY_REPORT) super.clone();
    return o;
  }

  public void clone0(VDN_AVLB_MINUTELY_FULLY_REPORT o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("ISP", this.ISP);
    __sqoop$field_map.put("CT", this.CT);
    __sqoop$field_map.put("TR", this.TR);
    __sqoop$field_map.put("CAT", this.CAT);
    __sqoop$field_map.put("A", this.A);
    __sqoop$field_map.put("B", this.B);
    __sqoop$field_map.put("C", this.C);
    __sqoop$field_map.put("C2", this.C2);
    __sqoop$field_map.put("C3", this.C3);
    __sqoop$field_map.put("C4", this.C4);
    __sqoop$field_map.put("D", this.D);
    __sqoop$field_map.put("D2", this.D2);
    __sqoop$field_map.put("D3", this.D3);
    __sqoop$field_map.put("E", this.E);
    __sqoop$field_map.put("F", this.F);
    __sqoop$field_map.put("F2", this.F2);
    __sqoop$field_map.put("G", this.G);
    __sqoop$field_map.put("G2", this.G2);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("ISP", this.ISP);
    __sqoop$field_map.put("CT", this.CT);
    __sqoop$field_map.put("TR", this.TR);
    __sqoop$field_map.put("CAT", this.CAT);
    __sqoop$field_map.put("A", this.A);
    __sqoop$field_map.put("B", this.B);
    __sqoop$field_map.put("C", this.C);
    __sqoop$field_map.put("C2", this.C2);
    __sqoop$field_map.put("C3", this.C3);
    __sqoop$field_map.put("C4", this.C4);
    __sqoop$field_map.put("D", this.D);
    __sqoop$field_map.put("D2", this.D2);
    __sqoop$field_map.put("D3", this.D3);
    __sqoop$field_map.put("E", this.E);
    __sqoop$field_map.put("F", this.F);
    __sqoop$field_map.put("F2", this.F2);
    __sqoop$field_map.put("G", this.G);
    __sqoop$field_map.put("G2", this.G2);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("ISP".equals(__fieldName)) {
      this.ISP = (String) __fieldVal;
    }
    else    if ("CT".equals(__fieldName)) {
      this.CT = (String) __fieldVal;
    }
    else    if ("TR".equals(__fieldName)) {
      this.TR = (String) __fieldVal;
    }
    else    if ("CAT".equals(__fieldName)) {
      this.CAT = (String) __fieldVal;
    }
    else    if ("A".equals(__fieldName)) {
      this.A = (Integer) __fieldVal;
    }
    else    if ("B".equals(__fieldName)) {
      this.B = (Integer) __fieldVal;
    }
    else    if ("C".equals(__fieldName)) {
      this.C = (Integer) __fieldVal;
    }
    else    if ("C2".equals(__fieldName)) {
      this.C2 = (Integer) __fieldVal;
    }
    else    if ("C3".equals(__fieldName)) {
      this.C3 = (Integer) __fieldVal;
    }
    else    if ("C4".equals(__fieldName)) {
      this.C4 = (Integer) __fieldVal;
    }
    else    if ("D".equals(__fieldName)) {
      this.D = (Integer) __fieldVal;
    }
    else    if ("D2".equals(__fieldName)) {
      this.D2 = (Integer) __fieldVal;
    }
    else    if ("D3".equals(__fieldName)) {
      this.D3 = (Integer) __fieldVal;
    }
    else    if ("E".equals(__fieldName)) {
      this.E = (Integer) __fieldVal;
    }
    else    if ("F".equals(__fieldName)) {
      this.F = (Integer) __fieldVal;
    }
    else    if ("F2".equals(__fieldName)) {
      this.F2 = (Integer) __fieldVal;
    }
    else    if ("G".equals(__fieldName)) {
      this.G = (Integer) __fieldVal;
    }
    else    if ("G2".equals(__fieldName)) {
      this.G2 = (Integer) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
  public boolean setField0(String __fieldName, Object __fieldVal) {
    if ("ISP".equals(__fieldName)) {
      this.ISP = (String) __fieldVal;
      return true;
    }
    else    if ("CT".equals(__fieldName)) {
      this.CT = (String) __fieldVal;
      return true;
    }
    else    if ("TR".equals(__fieldName)) {
      this.TR = (String) __fieldVal;
      return true;
    }
    else    if ("CAT".equals(__fieldName)) {
      this.CAT = (String) __fieldVal;
      return true;
    }
    else    if ("A".equals(__fieldName)) {
      this.A = (Integer) __fieldVal;
      return true;
    }
    else    if ("B".equals(__fieldName)) {
      this.B = (Integer) __fieldVal;
      return true;
    }
    else    if ("C".equals(__fieldName)) {
      this.C = (Integer) __fieldVal;
      return true;
    }
    else    if ("C2".equals(__fieldName)) {
      this.C2 = (Integer) __fieldVal;
      return true;
    }
    else    if ("C3".equals(__fieldName)) {
      this.C3 = (Integer) __fieldVal;
      return true;
    }
    else    if ("C4".equals(__fieldName)) {
      this.C4 = (Integer) __fieldVal;
      return true;
    }
    else    if ("D".equals(__fieldName)) {
      this.D = (Integer) __fieldVal;
      return true;
    }
    else    if ("D2".equals(__fieldName)) {
      this.D2 = (Integer) __fieldVal;
      return true;
    }
    else    if ("D3".equals(__fieldName)) {
      this.D3 = (Integer) __fieldVal;
      return true;
    }
    else    if ("E".equals(__fieldName)) {
      this.E = (Integer) __fieldVal;
      return true;
    }
    else    if ("F".equals(__fieldName)) {
      this.F = (Integer) __fieldVal;
      return true;
    }
    else    if ("F2".equals(__fieldName)) {
      this.F2 = (Integer) __fieldVal;
      return true;
    }
    else    if ("G".equals(__fieldName)) {
      this.G = (Integer) __fieldVal;
      return true;
    }
    else    if ("G2".equals(__fieldName)) {
      this.G2 = (Integer) __fieldVal;
      return true;
    }
    else {
      return false;    }
  }
}
