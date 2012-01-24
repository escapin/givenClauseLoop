/* Generated By:JavaCC: Do not edit this line. CommandLineParser.java */
package givenClauseLoop.CommandLineParser;

import givenClauseLoop.bean.CommandOptions;
import givenClauseLoop.bean.EnumClass;
import java.io.*;

public class CommandLineParser implements CommandLineParserConstants {

        private static CommandOptions opt;

        public static CommandOptions parsing(String[] args) throws FileNotFoundException, IOException, Exception{
                try{
                        if(args.length==0)
                                opt.help.append("Usage:\u005cn\u005ct" +
                                "java -jar givenClauseLoop.jar [-fifo | -best | -bestN] [-o | -e] [-timeN] [-contr | -exp] filePath\u005cn\u005ct" +
                                "java -jar givenClauseLoop.jar -help");

                        StringBuffer input = new StringBuffer("\u005ct" + args[args.length-1] + "\u005ct");
                        opt = new CommandOptions();
                        for(int i=0;i<args.length-1;i++)
                                input.append("\u005ct" + args[i] + "\u005ct");
                        //System.out.println(input);
                        new CommandLineParser(new java.io.StringReader(input.toString())).start();
                        if(opt.help.length()==0 && opt.filePath.equals(""))
                                throw new ParseException("no file path found");
                }catch(Throwable e){
                        // Catching Throwable is ugly but JavaCC throws Error objects!
                        //e.printStackTrace();
                        throw new ParseException("Syntax check failed: " + e.getMessage());
                }
                return opt;
        }

  static final public void start() throws ParseException {
    jj_consume_token(13);
    filePath();
    jj_consume_token(13);
    label_1:
    while (true) {
      switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
      case 13:
        ;
        break;
      default:
        jj_la1[0] = jj_gen;
        break label_1;
      }
      jj_consume_token(13);
      argument();
      jj_consume_token(13);
    }
    jj_consume_token(0);
  }

  static final public void argument() throws ParseException {
                  Token t1=null;
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case FIFO_STRATEGY:
      t1 = jj_consume_token(FIFO_STRATEGY);
    opt.clauseStrategy = EnumClass.clauseStrategy.FIFO;
      break;
    case BFS_STRATEGY:
      t1 = jj_consume_token(BFS_STRATEGY);
    opt.clauseStrategy = EnumClass.clauseStrategy.MIN_QUEUE;
    if(t1.image.length()>5)
        opt.peakGivenRatio= (new Integer(t1.image.substring(5, t1.image.length()))).intValue();
      break;
    case LOOP_TYPE:
      t1 = jj_consume_token(LOOP_TYPE);
        if(t1.image.equals("-o"))
        opt.loopType = EnumClass.LoopType.OTTER_LOOP;
    else
        opt.loopType = EnumClass.LoopType.E_LOOP;
      break;
    case TIME:
      t1 = jj_consume_token(TIME);
    opt.timeOut = (new Integer(t1.image.substring(5, t1.image.length()))).intValue();
      break;
    case RESEARCH_STRATEGY:
      t1 = jj_consume_token(RESEARCH_STRATEGY);
        if(t1.image.equals("-exp"))
        opt.researchStrategy = EnumClass.researchStrategy.EXP_BEFORE;
    else
        opt.researchStrategy = EnumClass.researchStrategy.CONTR_BEFORE;
      break;
    default:
      jj_la1[1] = jj_gen;
      jj_consume_token(-1);
      throw new ParseException();
    }
  }

  static final public void filePath() throws ParseException {
                  Token t;
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case FILEPATH:
      t = jj_consume_token(FILEPATH);
    opt.filePath=t.image;
      break;
    case 14:
      jj_consume_token(14);
        opt.help.append("Usage:\u005cn\u005ct" +
                        "java -jar givenClauseLoop.jar [-fifo | -best | -bestN] [-o | -e] [-timeN] [-contr | -exp] filePath\u005cn\u005ct" +
                        "java -jar givenClauseLoop.jar -help");
      break;
    default:
      jj_la1[2] = jj_gen;
      jj_consume_token(-1);
      throw new ParseException();
    }
  }

  static private boolean jj_initialized_once = false;
  /** Generated Token Manager. */
  static public CommandLineParserTokenManager token_source;
  static SimpleCharStream jj_input_stream;
  /** Current token. */
  static public Token token;
  /** Next token. */
  static public Token jj_nt;
  static private int jj_ntk;
  static private int jj_gen;
  static final private int[] jj_la1 = new int[3];
  static private int[] jj_la1_0;
  static {
      jj_la1_init_0();
   }
   private static void jj_la1_init_0() {
      jj_la1_0 = new int[] {0x2000,0x1f0,0x4200,};
   }

  /** Constructor with InputStream. */
  public CommandLineParser(java.io.InputStream stream) {
     this(stream, null);
  }
  /** Constructor with InputStream and supplied encoding */
  public CommandLineParser(java.io.InputStream stream, String encoding) {
    if (jj_initialized_once) {
      System.out.println("ERROR: Second call to constructor of static parser.  ");
      System.out.println("       You must either use ReInit() or set the JavaCC option STATIC to false");
      System.out.println("       during parser generation.");
      throw new Error();
    }
    jj_initialized_once = true;
    try { jj_input_stream = new SimpleCharStream(stream, encoding, 1, 1); } catch(java.io.UnsupportedEncodingException e) { throw new RuntimeException(e); }
    token_source = new CommandLineParserTokenManager(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 3; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  static public void ReInit(java.io.InputStream stream) {
     ReInit(stream, null);
  }
  /** Reinitialise. */
  static public void ReInit(java.io.InputStream stream, String encoding) {
    try { jj_input_stream.ReInit(stream, encoding, 1, 1); } catch(java.io.UnsupportedEncodingException e) { throw new RuntimeException(e); }
    token_source.ReInit(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 3; i++) jj_la1[i] = -1;
  }

  /** Constructor. */
  public CommandLineParser(java.io.Reader stream) {
    if (jj_initialized_once) {
      System.out.println("ERROR: Second call to constructor of static parser. ");
      System.out.println("       You must either use ReInit() or set the JavaCC option STATIC to false");
      System.out.println("       during parser generation.");
      throw new Error();
    }
    jj_initialized_once = true;
    jj_input_stream = new SimpleCharStream(stream, 1, 1);
    token_source = new CommandLineParserTokenManager(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 3; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  static public void ReInit(java.io.Reader stream) {
    jj_input_stream.ReInit(stream, 1, 1);
    token_source.ReInit(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 3; i++) jj_la1[i] = -1;
  }

  /** Constructor with generated Token Manager. */
  public CommandLineParser(CommandLineParserTokenManager tm) {
    if (jj_initialized_once) {
      System.out.println("ERROR: Second call to constructor of static parser. ");
      System.out.println("       You must either use ReInit() or set the JavaCC option STATIC to false");
      System.out.println("       during parser generation.");
      throw new Error();
    }
    jj_initialized_once = true;
    token_source = tm;
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 3; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  public void ReInit(CommandLineParserTokenManager tm) {
    token_source = tm;
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 3; i++) jj_la1[i] = -1;
  }

  static private Token jj_consume_token(int kind) throws ParseException {
    Token oldToken;
    if ((oldToken = token).next != null) token = token.next;
    else token = token.next = token_source.getNextToken();
    jj_ntk = -1;
    if (token.kind == kind) {
      jj_gen++;
      return token;
    }
    token = oldToken;
    jj_kind = kind;
    throw generateParseException();
  }


/** Get the next Token. */
  static final public Token getNextToken() {
    if (token.next != null) token = token.next;
    else token = token.next = token_source.getNextToken();
    jj_ntk = -1;
    jj_gen++;
    return token;
  }

/** Get the specific Token. */
  static final public Token getToken(int index) {
    Token t = token;
    for (int i = 0; i < index; i++) {
      if (t.next != null) t = t.next;
      else t = t.next = token_source.getNextToken();
    }
    return t;
  }

  static private int jj_ntk() {
    if ((jj_nt=token.next) == null)
      return (jj_ntk = (token.next=token_source.getNextToken()).kind);
    else
      return (jj_ntk = jj_nt.kind);
  }

  static private java.util.List<int[]> jj_expentries = new java.util.ArrayList<int[]>();
  static private int[] jj_expentry;
  static private int jj_kind = -1;

  /** Generate ParseException. */
  static public ParseException generateParseException() {
    jj_expentries.clear();
    boolean[] la1tokens = new boolean[15];
    if (jj_kind >= 0) {
      la1tokens[jj_kind] = true;
      jj_kind = -1;
    }
    for (int i = 0; i < 3; i++) {
      if (jj_la1[i] == jj_gen) {
        for (int j = 0; j < 32; j++) {
          if ((jj_la1_0[i] & (1<<j)) != 0) {
            la1tokens[j] = true;
          }
        }
      }
    }
    for (int i = 0; i < 15; i++) {
      if (la1tokens[i]) {
        jj_expentry = new int[1];
        jj_expentry[0] = i;
        jj_expentries.add(jj_expentry);
      }
    }
    int[][] exptokseq = new int[jj_expentries.size()][];
    for (int i = 0; i < jj_expentries.size(); i++) {
      exptokseq[i] = jj_expentries.get(i);
    }
    return new ParseException(token, exptokseq, tokenImage);
  }

  /** Enable tracing. */
  static final public void enable_tracing() {
  }

  /** Disable tracing. */
  static final public void disable_tracing() {
  }

}
