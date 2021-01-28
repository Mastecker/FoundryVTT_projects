//Small Macro that creates random Save/Ability/Skillchecks with 2d10+5

// Platz für Variablen
var ueberblick = "blub";	//Variable in der Abfrage nach skill, ability, save gefragt wird
let chatSkill = "";
let chatAbility = "";
let chatSave = "";
let messageHeader = "<i>DC that has to be rolled against (2d10+5) </i><br>"


// --------------------- Skills ----------------------

var skills = ["Strength (Athletics)","Dexterity (Acrobatics)","Dexterity (Sleight of Hand)","Dexterity (Stealth)",
			"Intelligence (Arcana)","Intelligence (History)","Intelligence (Investigation)","Intelligence (Nature)",
			"Intelligence (Religion)","Wisdom (Animal Handling)","Wisdom (Insight)","Wisdom (Medicine)","Wisdom (Perception)",
			"Wisdom (Survival)","Charisma (Deception)","Charisma (Intimidation)","Charisma (Persuasion)","Charisma (Performance)"] 

var skillRolls = [];
	for(var k =0; k < 18; k++){
		let r = new Roll("2d10 + @prof", {prof: 5}); //2d10+5
		r.evaluate();
		skillRolls.push({name: skills[k], roll: r.total});
	}
//Messagekreation
for (let skill of skillRolls) {
	chatSkill += `${skill.name}: ${skill.roll}<br>`;
}

// --------------------- Ability ----------------------

var abilities = ['Strength','Dexterity','Constitution','Intelligence','Wisdom','Charisma'];
var abilityRolls = []
	for(var i =0; i < 6; i++){
		let r = new Roll("2d10 + @prof", {prof: 5}); //2d10+5
		r.evaluate();
		abilityRolls.push({name: abilities[i], roll: r.total});
	}

//Messagekreation
for (let ability of abilityRolls) {
	chatAbility += `${ability.name}: ${ability.roll}<br>`;
}



// --------------------- Saves ----------------------

var savethrows = ['Strength (Save)','Dexterity (Save)','Constitution (Save)','Intelligence (Save)','Wisdom (Save)','Charisma (Save)']	
var saveRolls = [];
	for(var j =0; j < 6; j++){
		let r = new Roll("2d10 + @prof", {prof: 5}); //2d10+5
		r.evaluate();
		saveRolls.push({name: savethrows[j], roll: r.total});
	}

//Messagekreation
for (let save of saveRolls) {
	chatSave += `${save.name}: ${save.roll}<br>`;
}


//---------------------- Gesamtmessage --------------------


let chatMessageSkill = (messageHeader + chatSkill);
let chatMessageAbility = (messageHeader + chatAbility);
let chatMessageSave = (messageHeader + chatSave);


// Platz für Funktionen


	function ueberblickDialog(){		//Dialog in dem gewählt werden soll, welche Checks gefordert sind
		let d = new Dialog({
			title: "Overview",
			content: "<p>What should be asked for?</p>",
			buttons: {
			ability: {
			label: "Ability Check",
			callback: () => {ueberblick = "ability";}
			},
			skill: {
			label: "Skill Check",
			callback: () => {ueberblick = "skill";}
			},
			saving: {
				label: "Saving Throw",
				callback: () => {ueberblick = "save";}
			}
			},
			default: "skill",
			render: (html) => console.log("Register interactivity in the rendered dialog"),
				close: (html) => {
					if (ueberblick == "ability"){
						let chatData = {
							user: game.user._id,
							content: "<b>Ability Check</b><br>" + chatMessageAbility,
							whisper: game.users.entities.filter((u) => u.isGM).map((u) => u._id),
						  };
						ChatMessage.create(chatData, {});
					}
					else if(ueberblick == "skill"){
						let chatData = {
							user: game.user._id,
							content: "<b>Skill Check</b><br>" + chatMessageSkill,
							whisper: game.users.entities.filter((u) => u.isGM).map((u) => u._id),
						  };
						ChatMessage.create(chatData, {});
					}	
					else if (ueberblick == "save"){
						let chatData = {
							user: game.user._id,
							content: "<b>Saving Throw</b><br>" + chatMessageSave,
							whisper: game.users.entities.filter((u) => u.isGM).map((u) => u._id),
						  };
						ChatMessage.create(chatData, {});
					}
				}								
		});
		d.render(true);
		return;
	}

//Platz für Programm

/* ChatMessage.create({
	whisper: ChatMessage.getWhisperRecipients("GM"),
	content: "DC gegen den gewürfelt werden soll:"
}) */


ueberblickDialog();

