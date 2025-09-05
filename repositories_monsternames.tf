locals {
  repositories_monsternames = [
    {
      name : "monsternames.open-api"
      description : "OpenAPI definition for the monsternames RESTAPI",
      topics : ["open-api"],
      open_source : true,
    },
    {
      name : "monsternames.api"
      description : "Open-source RESTAPI realised via data-structure and algorithm driven Terraform principles.",
      topics : ["aws", "python", "docker"],
      open_source : true,
      visibility = "public"
    }
  ]
}