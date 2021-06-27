<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.5" tiledversion="1.7.0" name="balloon" tilewidth="32" tileheight="32" tilecount="2" columns="2" objectalignment="topleft">
 <tileoffset x="-16" y="-32"/>
 <image source="balloon.png" width="64" height="32"/>
 <tile id="0">
  <objectgroup draworder="index" id="2">
   <object id="1" x="8" y="8" width="16" height="16"/>
  </objectgroup>
 </tile>
 <tile id="1">
  <properties>
   <property name="tilename" value="pop"/>
  </properties>
  <animation>
   <frame tileid="1" duration="50"/>
  </animation>
 </tile>
</tileset>
