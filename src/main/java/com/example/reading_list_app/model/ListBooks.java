package com.example.reading_list_app.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ListBooks")
public class ListBooks {
    @Id
    @GeneratedValue
    private UUID listBookId;

    @ManyToOne
    @JoinColumn(name = "list_id", nullable = false)
    private ReadingList readingList;

    @ManyToOne
    @JoinColumn(name = "book_id", nullable = false)
    private Book book;

    @Column(name = "status", nullable = false)
    private String status;

    @Column(name = "progress", nullable = false)
    private Integer progress;

    @Column(name = "added_at", nullable = false, updatable = false)
    private LocalDateTime addedAt = LocalDateTime.now();
}
