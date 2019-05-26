// Generated from Inifile2.g4 by ANTLR 4.7.1
package inifile2;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link Inifile2Parser}.
 */
public interface Inifile2Listener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link Inifile2Parser#inifile}.
	 * @param ctx the parse tree
	 */
	void enterInifile(Inifile2Parser.InifileContext ctx);
	/**
	 * Exit a parse tree produced by {@link Inifile2Parser#inifile}.
	 * @param ctx the parse tree
	 */
	void exitInifile(Inifile2Parser.InifileContext ctx);
	/**
	 * Enter a parse tree produced by the {@code keyval}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 */
	void enterKeyval(Inifile2Parser.KeyvalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code keyval}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 */
	void exitKeyval(Inifile2Parser.KeyvalContext ctx);
	/**
	 * Enter a parse tree produced by the {@code header}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 */
	void enterHeader(Inifile2Parser.HeaderContext ctx);
	/**
	 * Exit a parse tree produced by the {@code header}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 */
	void exitHeader(Inifile2Parser.HeaderContext ctx);
	/**
	 * Enter a parse tree produced by the {@code comment}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 */
	void enterComment(Inifile2Parser.CommentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code comment}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 */
	void exitComment(Inifile2Parser.CommentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nl1}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 */
	void enterNl1(Inifile2Parser.Nl1Context ctx);
	/**
	 * Exit a parse tree produced by the {@code nl1}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 */
	void exitNl1(Inifile2Parser.Nl1Context ctx);
}