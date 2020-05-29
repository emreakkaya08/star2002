(* event_declarations.ml *)

open Core_kernel

(* examples only
   TODO: write actual events
*)

(* implicit log message *)
type Structured_events.t +=
  | Reached_block_height of {height: int; time: string}
  [@@deriving register_event]

(* explicit log message *)
type Structured_events.t += Proof_failure of {why: string}
  [@@deriving register_event {msg= "Proof failed because $why"}]

(* constructor without record argument *)
type Structured_events.t += Block_finalized [@@deriving register_event]

(* arbitrary string-valued expression for msg *)
type Structured_events.t += Donuts_are_ready
  [@@deriving
    register_event {msg= sprintf "My favorite flavor is: %s" "maple glazed"}]