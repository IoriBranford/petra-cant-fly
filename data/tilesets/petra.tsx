<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.5" tiledversion="1.7.0" name="petra" tilewidth="64" tileheight="64" tilecount="4" columns="4" objectalignment="topleft">
 <tileoffset x="-32" y="-32"/>
 <image source="petra.png" width="256" height="64"/>
 <tile id="0">
  <properties>
   <property name="tilename" value="stand"/>
  </properties>
  <objectgroup>
   <object id="1" x="16" y="24" width="32" height="16"/>
  </objectgroup>
 </tile>
 <tile id="1">
  <properties>
   <property name="tilename" value="jump"/>
  </properties>
  <objectgroup>
   <object id="1" x="16" y="24" width="32" height="16"/>
  </objectgroup>
 </tile>
 <tile id="2">
  <properties>
   <property name="tilename" value="fly"/>
  </properties>
  <objectgroup draworder="index" id="2">
   <object id="1" x="16" y="24" width="32" height="16"/>
  </objectgroup>
 </tile>
 <tile id="3">
  <properties>
   <property name="tilename" value="down"/>
  </properties>
  <objectgroup>
   <object id="1" x="16" y="24" width="32" height="16"/>
  </objectgroup>
 </tile>
</tileset>
