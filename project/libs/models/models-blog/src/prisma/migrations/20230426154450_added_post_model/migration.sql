-- CreateEnum
CREATE TYPE "PostStatus" AS ENUM ('posted', 'draft');

-- CreateEnum
CREATE TYPE "PostType" AS ENUM ('video', 'text', 'quote', 'photo', 'link');

-- CreateTable
CREATE TABLE "posts" (
    "post_id" SERIAL NOT NULL,
    "type" "PostType" NOT NULL,
    "user_id" TEXT NOT NULL DEFAULT '',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "publish_at" TIMESTAMP(3) NOT NULL,
    "status" "PostStatus" NOT NULL,
    "create_user_id" TEXT NOT NULL DEFAULT '',
    "is_reposted" BOOLEAN NOT NULL DEFAULT false,
    "title" TEXT,
    "video_link" TEXT,
    "announcement" TEXT,
    "text" TEXT,
    "photo" TEXT,
    "link" TEXT,
    "description" TEXT,
    "quote" TEXT,
    "quote_author" TEXT,
    "tags" TEXT[],
    "likes_count" INTEGER NOT NULL DEFAULT 0,
    "comments_count" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "posts_pkey" PRIMARY KEY ("post_id")
);

-- CreateTable
CREATE TABLE "comments" (
    "comment_id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "post_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id")
);

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts"("post_id") ON DELETE CASCADE ON UPDATE CASCADE;
