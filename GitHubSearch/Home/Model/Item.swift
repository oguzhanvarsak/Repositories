//
//  Item.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import Foundation

typealias Repository = Item

struct Item: Decodable {
    let id: Int?
    let nodeId: String?
    let name: String?
    let fullName: String?
    let `private`: Bool?
    let owner: Owner?
    let htmlUrl: String?
    let description: String?
    let fork: Bool?
    let Url: String?
    let forksUrl: String?
    let keysUrl: String?
    let collaboratorsUrl: String?
    let teamsUrl: String?
    let hooksUrl: String?
    let issueEventsUrl: String?
    let eventsUrl: String?
    let assigneesUrl: String?
    let branchesUrl: String?
    let tagsUrl: String?
    let blobsUrl: String?
    let gitTagsUrl: String?
    let gitRefsUrl: String?
    let treesUrl: String?
    let statusesUrl: String?
    let languagesUrl: String?
    let stargazersUrl: String?
    let contributorsUrl: String?
    let subscribersUrl: String?
    let subscriptionUrl: String?
    let commitsUrl: String?
    let gitCommitsUrl: String?
    let commentsUrl: String?
    let issueCommentUrl: String?
    let contentsUrl: String?
    let compareUrl: String?
    let mergesUrl: String?
    let archiveUrl: String?
    let downloadsUrl: String?
    let issuesUrl: String?
    let pullsUrl: String?
    let milestonesUrl: String?
    let notificationsUrl: String?
    let labelsUrl: String?
    let releasesUrl: String?
    let deploymentsUrl: String?
    let createdAt: String?
    let updatedAt: String?
    let pushedAt: String?
    let gitUrl: String?
    let sshUrl: String?
    let cloneUrl: String?
    let svnUrl: String?
    let homepage: String?
    let size: Int?
    let stargazersCount: Int?
    let watchersCount: Int?
    let language: String?
    let hasIssues: Bool?
    let hasProjects: Bool?
    let hasDownloads: Bool?
    let hasWiki: Bool?
    let hasPages: Bool?
    let forksCount: Int?
    let mirrorUrl: String?
    let archived: Bool?
    let disabled: Bool?
    let openIssuesCount: Int?
    let license: License?
    let allowForking: Bool?
    let isTemplate: Bool?
    let topics: [String]?
    let visibility: String?
    let forks: Int?
    let openIssues: Int?
    let watchers: Int?
    let defaultBranch: String?
    let permissions: Permissions?
    let score: Double?
}

struct Owner: Codable {
    let login: String?
    let id: Int?
    let nodeId: String?
    let avatarUrl: String?
    let gravatarId: String?
    let Url: String?
    let htmlUrl: String?
    let followersUrl: String?
    let followingUrl: String?
    let gistsUrl: String?
    let starredUrl: String?
    let subscriptionsUrl: String?
    let organizationsUrl: String?
    let reposUrl: String?
    let eventsUrl: String?
    let receivedEventsUrl: String?
    let type: String?
    let siteAdmin: Bool?
}

struct License: Codable {
    let key: String?
    let name: String?
    let spdxId: String?
    let Url: String?
    let nodeId: String?
}

struct Permissions: Codable {
    let admin: Bool?
    let maintain: Bool?
    let push: Bool?
    let triage: Bool?
    let pull: Bool?
}
