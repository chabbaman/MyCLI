import ArgumentParser
import Figlet

@main
struct CLI: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A CLI for testing",
        subcommands: [SayName.self, DoSomething.self, DoSomethingElse.self],
        defaultSubcommand: SayName.self
    )

    struct SayName: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "A test command")

        @Argument(help: "The name to say hello to")
        var name: String

        mutating func run() throws {
            Figlet.say("Hello, \(name)")
        }
    }

    struct DoSomething: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "A test command",
            discussion: "This command does something"
        )

        mutating func run() throws {
            print("Doing something")
        }
    }

    struct DoSomethingElse: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "A test command")

        mutating func run() throws {
            print("Doing something else")
        }
    }
}
