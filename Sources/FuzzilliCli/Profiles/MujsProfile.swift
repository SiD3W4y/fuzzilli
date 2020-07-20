import Fuzzilli

let mujsProfile = Profile(
    processArguments: ["-f"],

    processEnv: ["UBSAN_OPTIONS": "handle_segv=0"],

    codePrefix: """
                function main() {
                """,

    codeSuffix: """
                }
                main();
                """,

    ecmaVersion: ECMAScriptVersion.es5,

    crashTests: ["fuzzilli('FUZZILLI_CRASH', 0)", "fuzzilli('FUZZILLI_CRASH', 1)"],

    additionalCodeGenerators: WeightedList<CodeGenerator>([]),

    additionalBuiltins: [
        "gc"                :  .function([] => .undefined),
    ]
)
