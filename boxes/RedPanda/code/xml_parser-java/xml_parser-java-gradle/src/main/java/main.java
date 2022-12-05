import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;


public class main {
    public static void main (String[] args) {
        System.out.println("Hi there");

        parseXML();
        System.out.println("Done!");
        String line = "1||chimsunxoan||hehe||E:/haha";
//        String line = "1\\|\\|chimsunxoan\\|\\|hehe\\|\\|E:/haha";
        for (String l : line.split("\\|\\|")) {
            System.out.println(l);

        }
    }

    public static void parseXML() {
        try {
            String path = "src/main/resources/thefile.xml";
            SAXBuilder saxBuilder = new SAXBuilder();
            XMLOutputter xmlOutput = new XMLOutputter();
            xmlOutput.setFormat(Format.getPrettyFormat());
            File fd = new File(path);
            Document doc = saxBuilder.build(fd);
            Element rootElement = doc.getRootElement();


            xmlOutput.output(doc, new BufferedWriter(new FileWriter(fd)));

//            System.out.println(xmlOutput.outputString(rootElement));
        } catch (IOException e) {
            System.out.println("IOException: " + e.toString());
        } catch (JDOMException e) {
            System.out.println("JDOMException: " + e.toString());
        }


    }
}
