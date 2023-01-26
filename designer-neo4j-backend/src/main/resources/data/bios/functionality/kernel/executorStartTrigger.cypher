CREATE (`2`:TimeTrigger:_Identifiable {name: "PeriodicExecutorStart", cron: "0/5 * * ? * * *", active: true, uuid: "b03f4ef7-2a40-3360-aa6a-d20b55fd4bc2"}),
(`3`:Function:_Identifiable {name: "startExecutor", uuid: "450ba683-a315-3e4e-9d9e-75d0d41c28a0"}),
(`6`:NativeCall:_Identifiable {cypher: "MATCH (executor:JobExecutor) WHERE executor.running = false CALL custom.kernel.executor.startExecutor() YIELD errorMessage RETURN *", uuid: "cf7b93a5-cb46-3315-a448-cf9bc2bc532a"}),
(`2`)-[:EXECUTES {uuid: "ad9cac65-4db8-3bcb-bee7-4eea0ccb3fb4"}]->(`3`),
(`3`)-[:IMPLEMENTED {uuid: "7c18ccf2-4b8f-34e1-b9ae-daf6a3d48c91"}]->(`6`)
RETURN *