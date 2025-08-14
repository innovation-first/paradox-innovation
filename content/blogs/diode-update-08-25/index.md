--- 
title: "Di-iode Demonstrator: First Version Now Available on GitLab"
date: 2025-08-11T10:00:00+02:00
tags: ["open-source", "frugal-it", "data", "diode"]
categories: 
- Blog
authors: 
  - Jerome GLATIGNY
draft: false
toc: true
image: "shared/image-from-rawpixel-id-8683840-jpeg.jpg"
---
 
## Summary

The Di-iode project has reached a significant milestone with the release of its first demonstration version. This proof of concept, now available on GitLab, lays the foundation for the data diode system and showcases its core unidirectional data flow capabilities.

---
 
## Current Features

- **File Synchronization Between MinIO Buckets:**  
  The initial release includes two binaries—**anode-s3** and **cathode-s3**—that enable file synchronization from one MinIO bucket to another. This setup demonstrates how data can be securely transferred in one direction only.

- **Basic Protocol Implementation:**  
  The demonstrator uses a simple yet effective protocol. It incorporates integrity verification to ensure data is transmitted correctly, and supports multiple data streams, allowing several files to be received simultaneously.

- **UDP-Based Unidirectional Transfer:**  
  Data is split into chunks, encoded as messages, and sent over UDP. On the receiving side, the UDP stream is collected, messages are extracted and verified, and the correct data is sent to the upper layers of the system. This establishes robust, one-way communication as required for data diode applications.

## Technical Overview

Di-iode is developed in **Rust**, a language renowned for its performance, memory safety, and reliability—attributes that are essential for both security and high-throughput data transfer. The project leverages the **Tokio** crate, which provides a powerful asynchronous runtime and enables efficient, concurrent I/O operations.

{{< mermaiddiagram >}}
%%{init: {
  "theme": "neutral",
  "themeVariables": {
    "primaryColor": "#f6f7f9",
    "primaryBorderColor": "#cfd6e4",
    "primaryTextColor": "#0f172a",
    "actorBkg": "#ffffff",
    "actorTextColor": "#0f172a",
    "lineColor": "#64748b",
    "noteBkgColor": "#fff7ed",
    "noteTextColor": "#7c2d12"
  },
  "sequence": {
    "mirrorActors": false,
    "showSequenceNumbers": true,
    "actorMargin": 60,
    "boxMargin": 12,
    "boxTextMargin": 8,
    "noteMargin": 16
  }
}%%

sequenceDiagram
  autonumber

  %% Actors in left-to-right order
  actor U as Uploader
  participant P1 as MinIO (Source)
  participant D1 as Diode - Anode
  participant D2 as Diode - Cathode
  participant P2 as MinIO (Destination)
  actor C as Consumer

  %% --------- phase: ingest ---------------
  rect rgba(99,102,241,0.08)
    note over U,P1: Ingest phase
    U ->> P1: Add file
    P1 -->> D1: Event: ObjectCreated:Put
  end

  %% --------- phase: initialize flow ------
  rect rgba(34,197,94,0.08)
    note over D1,D2: Initialize data flow
    D1 ->> D2: Init flow
    activate D2
    D2 ->> P2: Create multipart upload
    P2 -->> D2: UploadID
  end

  %% --------- phase: transfer (chunks) ----
  rect rgba(59,130,246,0.08)
    note over D1,P2: Stream data as parts
    loop For each chunk
      D1 ->> D2: Chunk data
      D2 ->> P2: Upload part
      P2 -->> D2: ETag
    end
  end

  %% --------- phase: finalize -------------
  rect rgba(234,179,8,0.10)
    note over D2,P2: Finalize upload
    D1 ->> D2: End flow
    D2 ->> P2: Complete multipart upload
    deactivate D2
  end

  %% --------- consumption -----------------
  rect rgba(148,163,184,0.12)
    note over P2,C: File available to consumers
    C ->> P2: Access new file
  end

  %% --------- optional: error path --------
  alt Any part fails
    D2 -->> D1: Error detail
    D2 ->> P2: Abort multipart upload
    note right of D2: Logged & alerted
  end
{{< /mermaiddiagram >}}

### Async Streams and Concurrency

Due to its focus on data transmission, Di-iode extensively utilizes Rust’s `Stream` abstractions. These allow seamless handling of continuous data flows and enable the system to process multiple files and streams simultaneously. With Tokio’s lightweight "green threads" (tasks), the software achieves scalable concurrency without the overhead of traditional operating system threads. This makes it possible to serve multiple data channels efficiently, maximizing resource usage while maintaining strict reliability.

The combination of **async/await** syntax, streams, and Tokio’s concurrency primitives allows Di-iode to implement robust, high-performance unidirectional communication, further strengthening its suitability for secure networking environments.

### Sample Code

```rust
use di_iode_anode::{Anode, AnodeFileStream, DiIodeMsg};
use serde_json::json;

#[tokio::main]
async fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() == 1 {
        eprintln!("No file to send");
        return;
    }

    let mut anode = Anode::create(&addr).await.unwrap();
    let file_stream = AnodeFileStream::open(args[1].to_path_buf()).await.unwrap();
    let init_content = json!({
        "filename": file_stream.filename(),
        "file_size": file_stream.file_size(),
    });
    let init_msg = DiIodeMsg::raw(DiIodeMsg::INIT, serde_json::to_vec(&init_content).unwrap());
    anode.send_file_stream(init_msg, file_stream).await;
}
```

---
 
With this technical foundation, Di-iode is well-positioned for future enhancements and the integration of advanced features as the project evolves.

## Limitations and Future Developments

While the demonstrator successfully achieves unidirectional UDP-based synchronization, it does not yet include advanced features such as corruption recovery or encryption. These functionalities are planned for future iterations, when the protocol and all of the features will be defined.

Importantly, the component structure and modular design of Di-iode will make the future integration of these advanced capabilities straightforward. The current focus was on establishing the overall architecture and delivering a working end-to-end demonstration.

## Next Steps

This initial version serves as a **proof of concept**, validating the core technology and approach. Although it doesn’t yet implement the specific protocol features planned for later stages, it effectively addresses the project’s central challenge: secure, one-way data transfer over UDP.

As development progresses, the team will continue to enhance Di-iode with more robust features, security measures, and protocol improvements to meet demanding use cases for secure and reliable data diodes.

---
 
Stay tuned for updates and future releases as Di-iode evolves into a fully-featured data diode solution!