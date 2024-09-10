locals {
  monsternames = {
    "sudoblark.monsternames.open-api" : {
      description : "OpenAPI definition for the monsternames RESTAPI",
      topics : ["open-api"],
      open_source : true,
      visibility = "public"
    },
    "sudoblark.monsternames.api" : {
      description : "Lambda container for the monsternames-api RESTAPI backend.",
      topics : ["aws", "python", "docker"],
      open_source : true,
    }
  }
}