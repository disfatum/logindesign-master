// Generated from Inifile2.g4 by ANTLR 4.7.1
package inifile2;
import com.core.readers.IniFile;
import com.core.readers.IniSection;
import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

/**
 * This class provides an empty implementation of {@link Inifile2Visitor},
 * which can be extended to create a visitor which only needs to handle a subset
 * of the available methods.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public class Inifile2BaseVisitor<T> extends AbstractParseTreeVisitor<T> implements Inifile2Visitor<T> {
    
        private IniSection currentSection = null;
        private IniFile inifile = new IniFile();

    public IniFile getInifile() {
        return inifile;
    }
        
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.</p>
	 */
	@Override public T visitInifile(Inifile2Parser.InifileContext ctx) { return visitChildren(ctx); }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.</p>
	 */
	@Override public T visitKeyval(Inifile2Parser.KeyvalContext ctx) { 
            if(currentSection != null){
                currentSection.addKV(ctx.key.getText(), ctx.val.getText());
            }
            return visitChildren(ctx); }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.</p>
	 */
	@Override public T visitHeader(Inifile2Parser.HeaderContext ctx) { 
            currentSection = new IniSection(ctx.headtext.getText());
            inifile.addSection(currentSection);
            return visitChildren(ctx); }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.</p>
	 */
	@Override public T visitComment(Inifile2Parser.CommentContext ctx) { return visitChildren(ctx); }
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.</p>
	 */
	@Override public T visitNl1(Inifile2Parser.Nl1Context ctx) { return visitChildren(ctx); }
}