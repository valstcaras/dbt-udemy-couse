from snowflake.snowpark.functions import col, udf
from snowflake.snowpark.types import FloatType, StringType


def model(dbt, session):
    dbt.config(materialized="table")

    reviews = dbt.ref("fct_reviews")

    def polarity(text: str) -> float:
        from textblob import TextBlob  # import inside UDF: runs in Snowflake

        if text is None or not text.strip():
            return None
        return TextBlob(text).sentiment.polarity

    polarity_udf = udf(
        polarity,
        return_type=FloatType(),
        input_types=[StringType()],
        packages=["textblob"],
        session=session,
    )

    return reviews.with_column("SENTIMENT_SCORE", polarity_udf(col("REVIEW_TEXT")))