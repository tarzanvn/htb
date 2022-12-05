import xml.etree.ElementTree as ET

root = ET.parse('thefile.xml').getroot()

# print(root.find("total_views").text)
# print(root.find("lastName").text)
# print(root.find("root"))
# print(root.find("root").text)

print(ET.tostring(root, encoding='utf8').decode('utf8'))
