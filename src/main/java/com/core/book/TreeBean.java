package com.core.book;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.primefaces.event.NodeCollapseEvent;
import org.primefaces.event.NodeExpandEvent;
import org.primefaces.event.NodeSelectEvent;
import org.primefaces.event.NodeUnselectEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.model.DefaultTreeNode;
import org.primefaces.model.TreeNode;

import inifile2.Inifile2BaseVisitor;
import inifile2.Inifile2Lexer;
import inifile2.Inifile2Parser;
import com.core.readers.IniEntry;
import com.core.readers.IniSection;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

@ManagedBean(name="treeEventsView")
@ViewScoped
public class TreeBean implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -4651910509113182213L;
	//тринод, само дерево					
	private TreeNode chapterNode;
	//для прикола
	public  String FILEPATH = "";
	public  String FILENAME = "";
	//имена файлов выбранных 
	public List<String> selectfile;
	//имена выбранных
	private List<String> selected ;
	//имя и имя файла выбранного, таблицы справа
	public List<Selects> FN = new ArrayList<Selects>();
	boolean  counter = false;
	//выбранное имя в дереве
	public static String Select;
	//выбранный файл в дереве
	public static String Selectfile;
	// название файла, который будет отображаться
	public static String display;
	
    public TreeNode getchapterNode() { 
    	chapterNode = new DefaultTreeNode("Глава", null);
    	
        TreeNode inimodel = showTree("C:\\wildfly-16.0.0.Final\\standalone\\"
        		+ "deployments\\login-10.0.0-SNAPSHOT.war\\resources\\iniFile\\dbpart.ini");
        // адднод для нулевых элементов дерева, а остальные аддноды для вложенных
        addNode(chapterNode,inimodel.getChildren().get(0).toString(),inimodel.getChildren());
		
        return chapterNode;
       
    }
    //экшн для кнопки "стрелочки", которая вправо
    public void dAction() {
    	if(FILENAME!=null) {

        	selected.add(FILENAME);
        	FN.add(new Selects(FILENAME,FILEPATH));
    	}
    	//selectfile.add(FILEPATH);
    	System.out.println(FILENAME+" file "+FILEPATH+" file");
    }
  //экшн для кнопки "стрелочки", которая влево
    public void deleteAction() {
    	
    	for(int i = 0; i < FN.size();i++) {
    		if(FN.get(i).getFilename().equals(Select)) {
    			FN.remove(i);
    			i = FN.size()+999;
    		}
    		
    	}
    	selected.remove(Select);
    }
    //рут для дерева
    private TreeNode root;
    //секции для дерева
    ArrayList<IniSection> sections = new ArrayList<>();
    //выбранный лист дерева
    private TreeNode selectedNode;
    
    @PostConstruct
    public void init() {
    	selected = new ArrayList<String>();
        root = getchapterNode();
        selected.add(" ");
    }
    public TreeNode getRoot() {
        return root;
    }
 
    public TreeNode getSelectedNode() {
        return selectedNode;
    }
 
    public void setSelectedNode(TreeNode selectedNode) {
        this.selectedNode = selectedNode;
    }
    //евент на выбор справа
    public void onSelect(SelectEvent event) {
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Item Selected", event.getObject().toString()));
        Select = event.getObject().toString();
        for(int i = 0; i < FN.size();i++) {
        	if(FN.get(i).getFilename().equals(Select)) {
        		Selectfile = FN.get(i).getFilepath();
        		System.out.println(Selectfile+" selected file");
        		i = FN.size()+999;
        	}
        }
        
    }
     
    public void onUnselect(UnselectEvent event) {
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Item Unselected", event.getObject().toString()));
        Selectfile = "";
        Select = "";
    }
     
    public void onReorder() {
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "List Reordered", null));
    }
    public void onNodeExpand(NodeExpandEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Expanded", event.getTreeNode().toString());
        FacesContext.getCurrentInstance().addMessage(null, message);
    }
 
    public void onNodeCollapse(NodeCollapseEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Collapsed", event.getTreeNode().toString());
        FacesContext.getCurrentInstance().addMessage(null, message);
    }
    //евент дерева на выбор из дерева
    public void onNodeSelect(NodeSelectEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Selected", event.getTreeNode().toString());
        FacesContext.getCurrentInstance().addMessage(null, message);
        String s = event.getTreeNode().toString();
        System.out.println("selected  "+event.getTreeNode());
        String res = "";
        String chart ="";
        for(int i = 0; i < sections.size();i++) {
        	//
        	if(sections.get(i).getHeader().contains(s)) {
        		System.out.println("selected key"+ sections.get(i).getKeyval().get("PATHDAT")+" path");
        		res = sections.get(i).getKeyval().get("PATHDAT");
        		//name = sections.get(i).getKeyval().get("TITLE");
        		System.out.println("selected key"+ sections.get(i).getKeyval().get("TITLE") +" title");
        		System.out.println("selected key"+ sections.get(i).getKeyval().get("DISPLAY") +" display");
        		chart  = sections.get(i).getKeyval().get("DISPLAY");
        	}
        }
       display = chart;
       FILEPATH = res;
       FILENAME = event.getTreeNode().toString();
      }
 
    public void onNodeUnselect(NodeUnselectEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Unselected", event.getTreeNode().toString());
        FacesContext.getCurrentInstance().addMessage(null, message);
        System.out.println("\"Unselected\"");
    }

    private void addNode(TreeNode parentNode, String nodeName,List<TreeNode> children) {
        TreeNode node = new DefaultTreeNode(nodeName, parentNode);
        if(counter == false) {
        	node.setExpanded(true);
        	counter = true;
        }else {
        	node.setExpanded(false);
        }
       // children.remove(0);
        if (children != null) {
            for (TreeNode child : children) {
                addNode2(node, child.toString(),child.getChildren());
            }
        }
    }
    private void addNode2(TreeNode parentNode, String nodeName,List<TreeNode> children) {
        TreeNode node = new DefaultTreeNode(nodeName, parentNode);
        node.setExpanded(false);
        if (children != null) {
            for (TreeNode child : children) {
                addNode2(node, child.toString(),child.getChildren());
            }
        }
    }
//метод "показать дерево" , составляет само дерево
    public TreeNode showTree(String fname){
    	TreeNode treeModel = null;
        try {
            CharStream input = CharStreams.fromStream(new FileInputStream(fname), Charset.forName("Cp1251"));
            Inifile2Lexer lexer = new Inifile2Lexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            Inifile2Parser parser = new Inifile2Parser(tokens);
            ParseTree tree = parser.inifile();
            Inifile2BaseVisitor<Object> eval = new Inifile2BaseVisitor<Object>();
            eval.visit(tree);
            eval.getInifile().getSections().forEach(s->{
            	sections.add(s);
            //	System.out.println(s);
            }); 
            
            String secName = "";
            IniEntry root = null;
            IniEntry lev2 = null;
            //IniEntry lev3 = null;
            IniEntry current = null;
            for (IniSection is : eval.getInifile().getSections()) {
                secName = is.getHeader();
                IniEntry ie = new IniEntry(is);
                if (secName.contains("#") == false) {
                    if (current != null) {
                        current.getChildren().add(ie);
                    }
                } else {
                    if (secName.contains("#1")) {
                    	
                        ie.getIs().setHeader(is.getHeader().substring(secName.indexOf("#1")+1, secName.length()));
                        root = ie;
                        current = ie;
                    } else if (secName.contains("#2")) {
                    	ie.getIs().setHeader(is.getHeader().substring(secName.indexOf("#2")+1, secName.length()));
                        lev2 = ie;
                        current = ie;
                        if (root != null) {
                            root.getChildren().add(ie);
                        }
                    } else if (secName.contains("#3")) {
                    	ie.getIs().setHeader(is.getHeader().substring(secName.indexOf("#3")+1, secName.length()));
                        if(lev2!=null){
                            lev2.getChildren().add(ie);
                        }
                      //  lev3 = ie;
                        current = ie;
                    }
                }
            }
            treeModel = root;
          
        } catch (IOException e) {
          
        }
        return treeModel;
    }
	public String getFILEPATH() {
		return FILEPATH;
	}
	public void setFILEPATH(String fILEPATH) {
		FILEPATH = fILEPATH;
	}
	 public List<String> getSelected() {
	        return selected;
	}
	 
	public void setSelected(List<String> selected) {
	       this.selected = selected;
	}
}