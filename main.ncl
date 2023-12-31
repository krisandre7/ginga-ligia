<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="attribution" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgMenuFundo" left="0" top="0" width="40%" height="100%" />
			<region id="rgSelect1" left="35" top="140" width="30%" height="12%" />
			<region id="rgSelect2" left="35" top="230" width="30%" height="12%" />
			<region id="rgSelect3" left="35" top="320" width="30%" height="12%" />
			<region id="rgSelect4" left="35" top="410" width="30%" height="12%" />
			<region id="texto" left="45" top="500" width="30%" height="12%" />
			<region id="video" left="350" top="70" width="50%" height="80%" />
		</regionBase>
		<connectorBase>
			<causalConnector id="onSelect_and_TestStopStart">
				<compoundCondition operator="and">
					<simpleCondition role="onSelection"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="testIfFalse" 
						attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="false"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="par"/>
					<simpleAction role="start"/>
				</compoundAction>
			</causalConnector>
            <causalConnector id="onKeySelection_andTestTrueSetStop">
                <connectorParam name="vKey"/>
                <connectorParam name="var"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection" key="$vKey"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="testIfTrue" 
						attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="true"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="set" value="$var"/>
					<simpleAction role="stop" max="unbounded" qualifier="par"/>
				</compoundAction>
			</causalConnector>
            <causalConnector id="onKeySelection_andTestFalseSet">
                <connectorParam name="vKey"/>
                <connectorParam name="var"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection" key="$vKey"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="testIfFalse" 
						attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="false"/>
					</assessmentStatement>
				</compoundCondition>
                <simpleAction role="set" value="$var"/>
			</causalConnector>
			<causalConnector id="onEndAttribution_and_TestSetStopStart">
				<connectorParam name="var"/>

				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution" />
					<assessmentStatement comparator="eq">
						<attributeAssessment role="testIfTrue" 
						attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="true"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="set" value="$var" max="unbounded" qualifier="par"/>
					<simpleAction role="stop" max="unbounded" qualifier="par"/>
					<simpleAction role="start"/>	
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEnd_andTestSetStart">
				<connectorParam name="var"/>

				<compoundCondition operator="and">
					<simpleCondition role="onEnd" />
					<assessmentStatement comparator="eq">
						<attributeAssessment role="testIfTrue" 
						attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="true"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="set" value="$var"/>
					<simpleAction role="start"/>	
				</compoundAction>
			</causalConnector>
        </connectorBase>
		<descriptorBase>
			<descriptor id="dscMenuFundo" region="rgMenuFundo" />
			<descriptor id="dscSelect1" region="rgSelect1" focusIndex="1" moveDown="2" moveUp="4"/>	
			<descriptor id="dscSelect2" region="rgSelect2" focusIndex="2" moveDown="3" moveUp="1"/>
			<descriptor id="dscSelect3" region="rgSelect3" focusIndex="3" moveDown="4" moveUp="2"/>
			<descriptor id="dscSelect4" region="rgSelect4" focusIndex="4" moveUp="3" moveDown="1"/>	
			<descriptor id="dscTexto" region="texto"/>
			<descriptor id="dscVideo" region="video"/>
		</descriptorBase>
	</head>

	<body>
		<media id="settings" type="application/x-ginga-settings">
			<property name="service.currentFocus" value="1"/>
			<property name="carouselMode" value="false"/>
		</media>

		<port id="pMenuFundo" component="menuFundo"/>
		<media id="menuFundo" src="media/imagens/menufundo.png" descriptor="dscMenuFundo"/>
		
		<port id="pSelect1" component="Select1"/>
		<media id="Select1" src="media/imagens/central.png" descriptor="dscSelect1"/>

		<port id="pSelect2" component="Select2"/>
		<media id="Select2" src="media/imagens/estudantina.png" descriptor="dscSelect2"/>

		<port id="pSelect3" component="Select3"/>
		<media id="Select3" src="media/imagens/jardimbotanico.png" descriptor="dscSelect3"/>

		<port id="pSelect4" component="Select4"/>
		<media id="Select4" src="media/imagens/outras.png" descriptor="dscSelect4"/>

		<port id="pTexto" component="Texto"/>
		<media id="Texto" src="media/textos/todos.txt" descriptor="dscTexto">
			<property name="fontColor" value="blue"/>
		</media>
		
		<media id="Video1" src="media/videos/C2.mp4" descriptor="dscVideo">
			<property name="explicitDur" value="60s" />
			<!-- <property name="explicitDur" value="3s" /> -->
		</media>
		<media id="Video2" src="media/videos/E1.mp4" descriptor="dscVideo">
			<property name="explicitDur" value="60s" />
			<!-- <property name="explicitDur" value="3s" /> -->
		</media>
		<media id="Video3" src="media/videos/E2.mp4" descriptor="dscVideo">
			<property name="explicitDur" value="106s" />
			<!-- <property name="explicitDur" value="3s" /> -->
		</media>
		<media id="Video4" src="media/videos/C3.mp4" descriptor="dscVideo">
			<property name="explicitDur" value="88s" />
			<!-- <property name="explicitDur" value="3s" /> -->
		</media>


		<!-- lVideo: Se o botão SelectX for selecionado, para todos os vídeos
		     e inicia o vídeo VideoX. -->
      	<link id="lVideo1" xconnector="onSelect_and_TestStopStart">
			<bind role="onSelection" component="Select1"/>
			<bind role="testIfFalse" component="settings" interface="carouselMode"/>
			<bind role="stop" component="Video1"/>
			<bind role="stop" component="Video2"/>
			<bind role="stop" component="Video3"/>
			<bind role="stop" component="Video4"/>
			<bind role="start" component="Video1"/>
      	</link>
		<link id="lVideo2" xconnector="onSelect_and_TestStopStart">
			<bind role="onSelection" component="Select2"/>
			<bind role="testIfFalse" component="settings" interface="carouselMode"/>
			<bind role="stop" component="Video1"/>
			<bind role="stop" component="Video2"/>
			<bind role="stop" component="Video3"/>
			<bind role="stop" component="Video4"/>
			<bind role="start" component="Video2"/>
      	</link>
		<link id="lVideo3" xconnector="onSelect_and_TestStopStart">
			<bind role="onSelection" component="Select3"/>
			<bind role="testIfFalse" component="settings" interface="carouselMode"/>
			<bind role="stop" component="Video1"/>
			<bind role="stop" component="Video2"/>
			<bind role="stop" component="Video3"/>
			<bind role="stop" component="Video4"/>
			<bind role="start" component="Video3"/>
      	</link>
		<link id="lVideo4" xconnector="onSelect_and_TestStopStart">
			<bind role="onSelection" component="Select4"/>
			<bind role="testIfFalse" component="settings" interface="carouselMode"/>
			<bind role="stop" component="Video1"/>
			<bind role="stop" component="Video2"/>
			<bind role="stop" component="Video3"/>
			<bind role="stop" component="Video4"/>
			<bind role="start" component="Video4"/>
      	</link>

		<!-- lSetCarousel: Se a tecla azul for pressionada e o carrosel não está ativado,
			 configura o carouselMode pra false. Se o carrosel está desativado,
			configura o carouselMode pra true.  -->
		<link id="lSetCarouselFalse" xconnector="onKeySelection_andTestTrueSetStop">
			<bind role="onSelection" component="Select1">
				<bindParam name="vKey" value="BLUE"/>
			</bind>
			<bind role="testIfTrue" component="settings" interface="carouselMode"/>
			<bind role="set" component="settings" interface="carouselMode">
				<bindParam name="var" value="false"/>
			</bind>
			<bind role="stop" component="Video1"/>
			<bind role="stop" component="Video2"/>
			<bind role="stop" component="Video3"/>
			<bind role="stop" component="Video4"/>
		</link>
		<link id="lSetCarouselTrue" xconnector="onKeySelection_andTestFalseSet">
			<bind role="onSelection" component="Select1">
				<bindParam name="vKey" value="BLUE"/>
			</bind>
			<bind role="testIfFalse" component="settings" interface="carouselMode"/>
			<bind role="set" component="settings" interface="carouselMode">
				<bindParam name="var" value="true"/>
			</bind>
		</link>

		<!-- Carousel Loop -->

		<!-- lStartCarousel: Depois de carouselMode = true, 
		     configura o currentFocus no vídeo 1, para os outros vídeos 
			 e inicia o vídeo 1. -->
		<link id="lStartCarousel" xconnector="onEndAttribution_and_TestSetStopStart">
			<bind role="onEndAttribution" component="settings"
			interface="carouselMode"/>
			<bind role="testIfTrue" component="settings" interface="carouselMode"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="var" value="1"/>
			</bind>
			<bind role="set" component="Video1" interface="explicitDur">
				<bindParam name="var" value="20s"/>
			</bind>
			<bind role="set" component="Video2" interface="explicitDur">
				<bindParam name="var" value="20s"/>
			</bind>
			<bind role="set" component="Video3" interface="explicitDur">
				<bindParam name="var" value="20s"/>
			</bind>
			<bind role="set" component="Video4" interface="explicitDur">
				<bindParam name="var" value="20s"/>
			</bind>
			<bind role="stop" component="Video1"/>
			<bind role="stop" component="Video2"/>
			<bind role="stop" component="Video3"/>
			<bind role="stop" component="Video4"/>
			<bind role="start" component="Video1"/>
		</link>

		<!-- NextVideoX: When the previous video ends, check if carouselMode is true,
		     set currentFocus to X and start the video videoX. -->
		<link id="lNextVideo2" xconnector="onEnd_andTestSetStart">
			<bind role="onEnd" component="Video1"/>
			<bind role="testIfTrue" component="settings" interface="carouselMode"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="var" value="2"/>
			</bind>
			<bind role="start" component="Video2"/>
		</link>
		<link id="lNextVideo3" xconnector="onEnd_andTestSetStart">
			<bind role="onEnd" component="Video2"/>
			<bind role="testIfTrue" component="settings" interface="carouselMode"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="var" value="3"/>
			</bind>
			<bind role="start" component="Video3"/>
		</link>
		<link id="lNextVideo4" xconnector="onEnd_andTestSetStart">
			<bind role="onEnd" component="Video3"/>
			<bind role="testIfTrue" component="settings" interface="carouselMode"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="var" value="4"/>
			</bind>
			<bind role="start" component="Video4"/>
		</link>
		<link id="lNextVideo1" xconnector="onEnd_andTestSetStart">
			<bind role="onEnd" component="Video4"/>
			<bind role="testIfTrue" component="settings" interface="carouselMode"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="var" value="1"/>
			</bind>
			<bind role="start" component="Video1"/>
		</link>

	</body>
</ncl>
