using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Xml;

namespace VideoOnDemand.Model
{
    public class ClsConnectionString
    {
        public ClsConnectionString()
        {

        }
        public static string getConnectionString()
        {

            //if (ConfigurationManager.ConnectionStrings["VODConnection"].ConnectionString == string.Empty)
            //    throw new ConfigurationErrorsException("ConnectionString is empty or not valid");
            //return ConfigurationManager.ConnectionStrings["VODConnection"].ConnectionString;
            return BuildConnectionString();
        }

        public static string getVideosServerPath()
        {

            if (ConfigurationManager.AppSettings["VideoFileServerPath"] == string.Empty)
                throw new ConfigurationErrorsException("Videos server path is empty or not valid");
            return ConfigurationManager.AppSettings["VideoFileServerPath"];
        }


        public static string DefaultDBConnection()
        {
            return ConfigurationManager.AppSettings["DefaultServerDetails"];

        }
        public static string BuildConnectionString()
        {


            SqlConnectionStringBuilder myBuilder = new SqlConnectionStringBuilder();
            try
            {
                using (XmlTextReader reader = new XmlTextReader(Global.ApplicationPath + "DynamicConnectionString.xml"))
                {

                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.Load(reader);
                    reader.Close();
                    XmlNode xnod = xmlDoc.DocumentElement;
                    int i = 0;
                    foreach (System.Xml.XmlNode n in xnod)
                    {
                        if (n.Name == "DataSource")
                        {
                            myBuilder.DataSource = n.InnerText;

                        }
                        else if (n.Name == "InitialCatalog")
                        {
                            myBuilder.InitialCatalog = n.InnerText;

                        }
                        else if (n.Name == "Port")
                        {
                            if (n.InnerText != string.Empty)
                            {
                                if (!string.IsNullOrEmpty(n.InnerText))
                                    myBuilder.DataSource = myBuilder.DataSource + "," + n.InnerText;

                            }
                        }
                        else if (n.Name == "UserID")
                        {
                            myBuilder.UserID = n.InnerText;
                        }
                        else if (n.Name == "Password")
                        {
                            myBuilder.Password = n.InnerText;
                        }
                        //str[i] = n.InnerText;
                        //i++;
                    }

                    //WriteConnectionStringToFile(myBuilder.InitialCatalog, myBuilder.DataSource, "", myBuilder.UserID, myBuilder.Password);
                    if (myBuilder.DataSource.LastIndexOf(',') == myBuilder.DataSource.Length - 1)
                        myBuilder.DataSource.Substring(0, myBuilder.DataSource.Length - 1);




                    return myBuilder.ConnectionString;

                }
            }
            catch (Exception ex)
            {
                return "";
            }
        }



        public static bool WriteConnectionStringToFile(string initialCatalog, string DataSource, string Port, string UserId, string Password)
        {
            XmlDocument xmlDoc;
            try
            {
                string filename = Global.ApplicationPath + "DynamicConnectionString.xml";
                //assigning file name of desired file we want to create.

                xmlDoc = new XmlDocument();

                //creating new XML document

                using (XmlTextWriter xmlWriter = new XmlTextWriter(filename, System.Text.Encoding.UTF8))
                {

                    //creating XmlTestWriter, and passing file name and encoding type as argument

                    var settings = new XmlWriterSettings();
                    settings.CloseOutput = true;
                    settings.Indent = true;
                    settings.NewLineChars = " ";
                    settings.NewLineOnAttributes = true;


                    xmlWriter.Formatting = Formatting.Indented;
                    //setting XmlWriter formating to be indented

                    xmlWriter.WriteProcessingInstruction("xml", "version='1.0' encoding='UTF-8'");
                    //writing version and encoding type of XML in file.

                    xmlWriter.WriteStartElement("appSettings");
                    //writing first element

                    xmlWriter.Close();
                    //closing writer


                    xmlDoc.Load(filename);
                    //loading XML file


                    XmlNode root = xmlDoc.DocumentElement;
                    //creating child nodes.

                    XmlElement intCatalog = xmlDoc.CreateElement("InitialCatalog");
                    XmlElement dataSource = xmlDoc.CreateElement("DataSource");
                    XmlElement port = xmlDoc.CreateElement("Port");
                    XmlElement userID = xmlDoc.CreateElement("UserID");
                    XmlElement password = xmlDoc.CreateElement("Password");


                    //adding child node to root.

                    root.AppendChild(intCatalog);
                    intCatalog.InnerText = (initialCatalog);
                    //assigning innertext of childnode to text of combobox.

                    root.AppendChild(dataSource);
                    dataSource.InnerText = (DataSource);

                    root.AppendChild(port);
                    port.InnerText = (Port);

                    root.AppendChild(userID);
                    userID.InnerText = (UserId);

                    root.AppendChild(password);
                    password.InnerText = (Password);

                    xmlDoc.Save(filename);
                    //saving xml file
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
                //Response.Write(ex.Message);
            }
            finally
            {

            }
        }





    }



}