// Generated from Inifile2.g4 by ANTLR 4.7.1
package inifile2;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class Inifile2Parser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, ANYSYMB=4, LINE_COMMENT=5, NL=6;
	public static final int
		RULE_inifile = 0, RULE_iniline = 1;
	public static final String[] ruleNames = {
		"inifile", "iniline"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'='", "'['", "']'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, "ANYSYMB", "LINE_COMMENT", "NL"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "Inifile2.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public Inifile2Parser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class InifileContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(Inifile2Parser.EOF, 0); }
		public List<InilineContext> iniline() {
			return getRuleContexts(InilineContext.class);
		}
		public InilineContext iniline(int i) {
			return getRuleContext(InilineContext.class,i);
		}
		public InifileContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_inifile; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).enterInifile(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).exitInifile(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof Inifile2Visitor ) return ((Inifile2Visitor<? extends T>)visitor).visitInifile(this);
			else return visitor.visitChildren(this);
		}
	}

	public final InifileContext inifile() throws RecognitionException {
		InifileContext _localctx = new InifileContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_inifile);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(7);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << ANYSYMB) | (1L << LINE_COMMENT) | (1L << NL))) != 0)) {
				{
				{
				setState(4);
				iniline();
				}
				}
				setState(9);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(10);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class InilineContext extends ParserRuleContext {
		public InilineContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_iniline; }
	 
		public InilineContext() { }
		public void copyFrom(InilineContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class Nl1Context extends InilineContext {
		public TerminalNode NL() { return getToken(Inifile2Parser.NL, 0); }
		public Nl1Context(InilineContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).enterNl1(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).exitNl1(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof Inifile2Visitor ) return ((Inifile2Visitor<? extends T>)visitor).visitNl1(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class HeaderContext extends InilineContext {
		public Token headtext;
		public TerminalNode NL() { return getToken(Inifile2Parser.NL, 0); }
		public TerminalNode ANYSYMB() { return getToken(Inifile2Parser.ANYSYMB, 0); }
		public HeaderContext(InilineContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).enterHeader(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).exitHeader(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof Inifile2Visitor ) return ((Inifile2Visitor<? extends T>)visitor).visitHeader(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class CommentContext extends InilineContext {
		public TerminalNode LINE_COMMENT() { return getToken(Inifile2Parser.LINE_COMMENT, 0); }
		public CommentContext(InilineContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).enterComment(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).exitComment(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof Inifile2Visitor ) return ((Inifile2Visitor<? extends T>)visitor).visitComment(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class KeyvalContext extends InilineContext {
		public Token key;
		public Token val;
		public TerminalNode NL() { return getToken(Inifile2Parser.NL, 0); }
		public List<TerminalNode> ANYSYMB() { return getTokens(Inifile2Parser.ANYSYMB); }
		public TerminalNode ANYSYMB(int i) {
			return getToken(Inifile2Parser.ANYSYMB, i);
		}
		public KeyvalContext(InilineContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).enterKeyval(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof Inifile2Listener ) ((Inifile2Listener)listener).exitKeyval(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof Inifile2Visitor ) return ((Inifile2Visitor<? extends T>)visitor).visitKeyval(this);
			else return visitor.visitChildren(this);
		}
	}

	public final InilineContext iniline() throws RecognitionException {
		InilineContext _localctx = new InilineContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_iniline);
		try {
			setState(22);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case ANYSYMB:
				_localctx = new KeyvalContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(12);
				((KeyvalContext)_localctx).key = match(ANYSYMB);
				setState(13);
				match(T__0);
				setState(14);
				((KeyvalContext)_localctx).val = match(ANYSYMB);
				setState(15);
				match(NL);
				}
				break;
			case T__1:
				_localctx = new HeaderContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(16);
				match(T__1);
				setState(17);
				((HeaderContext)_localctx).headtext = match(ANYSYMB);
				setState(18);
				match(T__2);
				setState(19);
				match(NL);
				}
				break;
			case LINE_COMMENT:
				_localctx = new CommentContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(20);
				match(LINE_COMMENT);
				}
				break;
			case NL:
				_localctx = new Nl1Context(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(21);
				match(NL);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\b\33\4\2\t\2\4\3"+
		"\t\3\3\2\7\2\b\n\2\f\2\16\2\13\13\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\5\3\31\n\3\3\3\2\2\4\2\4\2\2\2\34\2\t\3\2\2\2\4\30\3\2"+
		"\2\2\6\b\5\4\3\2\7\6\3\2\2\2\b\13\3\2\2\2\t\7\3\2\2\2\t\n\3\2\2\2\n\f"+
		"\3\2\2\2\13\t\3\2\2\2\f\r\7\2\2\3\r\3\3\2\2\2\16\17\7\6\2\2\17\20\7\3"+
		"\2\2\20\21\7\6\2\2\21\31\7\b\2\2\22\23\7\4\2\2\23\24\7\6\2\2\24\25\7\5"+
		"\2\2\25\31\7\b\2\2\26\31\7\7\2\2\27\31\7\b\2\2\30\16\3\2\2\2\30\22\3\2"+
		"\2\2\30\26\3\2\2\2\30\27\3\2\2\2\31\5\3\2\2\2\4\t\30";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}