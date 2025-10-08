local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
return {
	s(
		"rustscript",
		fmt(
			[[
#!/usr/bin/env rust-script
//! ```cargo
//! [dependencies]
//! clap = { version = "4.5", features = ["derive"] }
//! ```
use std::path::PathBuf;

use clap::{Parser, Subcommand};

#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Args {
    /// Optional name to operate on
    name: Option<<String>>,

    /// Sets a custom config file
    #[arg(short, long, value_name = "FILE")]
    config: Option<<PathBuf>>,

    #[command(subcommand)]
    command: Option<<Commands>>,
}

#[derive(Subcommand)]
enum Commands {
    /// does testing things
    Test {
        /// lists test values
        #[arg(short, long)]
        list: bool,
    },
}

fn main() {
    let args = Args::parse();
    // You can check the value provided by positional arguments, or option arguments
    if let Some(name) = args.name.as_deref() {
        println!("Value for name: {name}");
    }

    if let Some(config) = args.config.as_deref() {
        println!("Value for config: {}", config.display());
    }

    // You can check for the existence of subcommands, and if found use their
    // matches just as you would the top level cmd
    match &args.command {
        Some(Commands::Test { list }) =>> {
            if *list {
                println!("Printing testing lists...");
            } else {
                println!("Not printing testing lists...");
            }
        }
        None =>> {}
    }
}
]],
			{},
			{ delimiters = "<>" }
		)
	),
}
