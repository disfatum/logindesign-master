// Generated from Inifile2.g4 by ANTLR 4.7.1
package inifile2;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link Inifile2Parser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface Inifile2Visitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link Inifile2Parser#inifile}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInifile(Inifile2Parser.InifileContext ctx);
	/**
	 * Visit a parse tree produced by the {@code keyval}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitKeyval(Inifile2Parser.KeyvalContext ctx);
	/**
	 * Visit a parse tree produced by the {@code header}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitHeader(Inifile2Parser.HeaderContext ctx);
	/**
	 * Visit a parse tree produced by the {@code comment}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitComment(Inifile2Parser.CommentContext ctx);
	/**
	 * Visit a parse tree produced by the {@code nl1}
	 * labeled alternative in {@link Inifile2Parser#iniline}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNl1(Inifile2Parser.Nl1Context ctx);
}